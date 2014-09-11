class CommentsController < ApplicationController


  def new
    @newcomment = current_user.comments.build({:name => "default"})
  end

  def create
      @newcomment = current_user.comments.build(comment_params)

      unless @newcomment.comment_content == ""
      	if @newcomment.save(comment_params)
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
    comment = Comment.find(params[:id]).destroy
      redirect_to :back
  end

  private
      def comment_params
      params.require(:comment).permit(:user_id, :post_id, :comment_content)
    end
end
