class PostsController < ApplicationController


  def index
  	@posts = Post.order("posts.created_at DESC")
  	@comments = Comment.order("comments.created_at ASC")
  
  
  end

def new
  @newpost = Post.new({:name => "default"})
end

  def create
      @newpost = Post.new(post_params)
        
      unless @newpost.post_content == ""
      	if @newpost.save(post_params)
          redirect_to root_path

  
        else
          flash[:alert] = "Post was not created successfully."
          @posts = Post.order("posts.created_at DESC")
          @comments = Comment.order("comments.created_at ASC")
          redirect_to root_path
        end
      else
          flash[:alert] = "Post cannot be blank."
          @posts = Post.order("posts.created_at DESC")
          @comments = Comment.order("comments.created_at ASC")
          redirect_to root_path        

      end

  end

  def delete
  end

  def destroy
    post = Post.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end



private

    def post_params
      params.require(:post).permit(:user_id, :post_content)
    end


end
