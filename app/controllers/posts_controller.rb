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
  	if @newpost.save(post_params)
      flash[:notice] = "Post created successfully."
      redirect_to(:action => 'index')
    else
     flash[:notice] = "Post was not creates successfully."
      render('index')
    end
  end

  def delete
  end

  def destroy
    post = Post.find(params[:id]).destroy
    flash[:notice] = "Post destroyed successfully."
    redirect_to(:action => 'index')
  end

private

    def post_params
      params.require(:post).permit(:user_id, :post_content)
    end


end
