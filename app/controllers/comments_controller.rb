class CommentsController < ApplicationController


  def new
    @newcomment = current_user.comments.build({:name => "default"})
  end

  def create
      u = User.all
      h = {}
      u.each do |i|
        h["@" + i.first_name + "_" + i.last_name] = i.id
      end

      @newcomment = current_user.comments.new(comment_params)

      #adds <a>for http and https
      arr = @newcomment.comment_content.split(" ")
      arr2 = []
      arr.each do |word|
        if word.include? "http://" 
          a_tag = "<span class='link'><a href= '#{word}' >#{word}</a></span>"
          word = a_tag
        elsif word.include? "https://"
          a_tag = "<span class='link'><a href= '#{word}' >#{word}</a></span>"
          word = a_tag
        end
        arr2 << word
      end
      string = arr2.join(" ")
      @newcomment.comment_content = string

      unless @newcomment.comment_content == ""
      	if @newcomment.save
          h.each do |k,v|
            if @newcomment.comment_content.include? k
              @newcomment.mention!(User.find_by_id(v))
              MentionNotification.mention_comment(v, @newcomment).deliver 
            end
          end
          redirect_to :back
        else
         flash[:notice] = "Comment was not created successfully."
          @posts = Post.order("posts.created_at DESC")
          @comments = Comment.order("comments.created_at ASC")
          redirect_to :back      
        end
      else
          flash[:alert] = "Comment cannot be blank."
          @posts = Post.order("posts.created_at DESC")
          @comments = Comment.order("comments.created_at ASC")
          redirect_to :back
      end
  end

  def delete
  end

  def destroy
    if current_user == Comment.find(params[:id]).user
      comment = Comment.find(params[:id]).destroy
      redirect_to :back
    else
      flash[:notice] = "You are not authorized to delete that comment."
      redirect_to :back
    end
  end

  private
      def comment_params
      params.require(:comment).permit(:user_id, :post_id, :comment_content)
  end
end
