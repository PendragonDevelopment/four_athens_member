class CommentsController < ApplicationController


  def new
    @newcomment = Comment.new({:name => "default"})
  end

  def create
    @newcomment = Comment.new(comment_params)
  	if @newcomment.save(comment_params)
      flash[:notice] = "Comment created successfully."
      redirect_to(:controller => "posts", :action => 'index')
    else
     flash[:notice] = "Comment was not creates successfully."
      render('index')
    end
  end

  def delete


  end

  def destroy
    comment = Comment.find(params[:id]).destroy
    flash[:notice] = "Comment destroyed successfully."
    redirect_to(:controller => "posts", :action => 'index')
  end

  private
      def comment_params
      params.require(:comment).permit(:user_id, :post_id, :comment_content)
    end
end
