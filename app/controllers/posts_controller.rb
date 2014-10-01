class PostsController < ApplicationController
before_action :authenticate_user!

  def index
    @comments = Comment.order("comments.created_at ASC")  

    @page = "Whiteboard"
    @posts = Post.order("posts.created_at DESC").page(params[:page]).per_page(10)
    user_name = User.pluck(:first_name, :last_name)
    a = []
    user_name.each do |i|
      a << i.join("_")
    end
    @username = a
  end

  def new
    @newpost = current_user.posts.build({:name => "default"})
  end

  def create
      u = User.all
      h = {}
      u.each do |i|
        h["@" + i.first_name + "_" + i.last_name] = i.id
      end

      @newpost = current_user.posts.build(post_params)
        
      unless @newpost.post_content == ""
      	if @newpost.save(post_params)
          h.each do |k,v|
            if @newpost.post_content.include? k
              @newpost.mention!(User.find_by_id(v))
              MentionNotification.mention_post(v, @newpost).deliver 
            end
          end
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
    redirect_to root_path
  end

  def hiring
    @posts = Post.where({ hiring: 1}).order("posts.created_at DESC").page(params[:page]).per_page(10)
    @comments = Comment.order("comments.created_at ASC")
    @page = "Hiring"
  end

  def promote
    @posts = Post.where({ promote: 1}).order("posts.created_at DESC").page(params[:page]).per_page(10)
    @comments = Comment.order("comments.created_at ASC")
    @page = "Promote"
  end

  def launch
    @posts = Post.where({ launch: 1}).order("posts.created_at DESC").page(params[:page]).per_page(10)
    @comments = Comment.order("comments.created_at ASC")
    @page = "Launch"
  end

  def tools
    @posts = Post.where({ tools: 1}).order("posts.created_at DESC").page(params[:page]).per_page(10)
    @comments = Comment.order("comments.created_at ASC")
    @page = "Tools"
  end
  
  def request_thing
    @posts = Post.where({ request: 1}).order("posts.created_at DESC").page(params[:page]).per_page(10)
    @comments = Comment.order("comments.created_at ASC")
    @page = "Requests"
  end
  
  def event
    @posts = Post.where({ event: 1}).order("posts.created_at DESC").page(params[:page]).per_page(10)
    @comments = Comment.order("comments.created_at ASC")
    @page = "Events"
  end




private

    def post_params
      params.require(:post).permit(:user_id, :post_content, :hiring, :promote, :launch, :tools, :request, :event)
    end


end
