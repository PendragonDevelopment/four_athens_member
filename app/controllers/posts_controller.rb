class PostsController < ApplicationController
before_action :authenticate_user!
load_and_authorize_resource

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

#creates an array with a list of users, @user_name
      u = User.all
      h = {}
      u.each do |i|
        h["@" + i.first_name + "_" + i.last_name] = i.id
      end

      @newpost = current_user.posts.new(post_params)

#adds <a>for http and https
      arr = @newpost.post_content.split(" ")
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
      @newpost.post_content = string


      unless @newpost.post_content == ""
      	if @newpost.save
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
    if current_user == Post.find(params[:id]).user
      post = Post.find(params[:id]).destroy
      redirect_to :back
    else
      flash[:notice] = "You are not authorized to delete that post."
      redirect_to :back
    end

  end

  def hiring
    @posts = Post.where({ hiring: 1}).order("posts.created_at DESC").page(params[:page]).per_page(10)
    @comments = Comment.order("comments.created_at ASC")
    @page = "Hiring"
    user_name = User.pluck(:first_name, :last_name)
    a = []
    user_name.each do |i|
      a << i.join("_")
    end
    @username = a
  end

  def promote
    @posts = Post.where({ promote: 1}).order("posts.created_at DESC").page(params[:page]).per_page(10)
    @comments = Comment.order("comments.created_at ASC")
    @page = "Promote"
    user_name = User.pluck(:first_name, :last_name)
    a = []
    user_name.each do |i|
      a << i.join("_")
    end
    @username = a
  end

  def launch
    @posts = Post.where({ launch: 1}).order("posts.created_at DESC").page(params[:page]).per_page(10)
    @comments = Comment.order("comments.created_at ASC")
    @page = "Launch"
    user_name = User.pluck(:first_name, :last_name)
    a = []
    user_name.each do |i|
      a << i.join("_")
    end
    @username = a
  end

  def tools
    @posts = Post.where({ tools: 1}).order("posts.created_at DESC").page(params[:page]).per_page(10)
    @comments = Comment.order("comments.created_at ASC")
    @page = "Tools"
    user_name = User.pluck(:first_name, :last_name)
    a = []
    user_name.each do |i|
      a << i.join("_")
    end
    @username = a
  end
  
  def request_thing
    @posts = Post.where({ request: 1}).order("posts.created_at DESC").page(params[:page]).per_page(10)
    @comments = Comment.order("comments.created_at ASC")
    @page = "Requests"
    user_name = User.pluck(:first_name, :last_name)
    a = []
    user_name.each do |i|
      a << i.join("_")
    end
    @username = a
  end
  
  def event
    @posts = Post.where({ event: 1}).order("posts.created_at DESC").page(params[:page]).per_page(10)
    @comments = Comment.order("comments.created_at ASC")
    @page = "Events"
    user_name = User.pluck(:first_name, :last_name)
    a = []
    user_name.each do |i|
      a << i.join("_")
    end
    @username = a
  end




private

    def post_params
      params.require(:post).permit(:user_id, :post_content, :hiring, :promote, :launch, :tools, :request, :event)
    end


end
