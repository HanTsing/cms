class PostsController < ApplicationController
  #load_and_authorize_resource

  before_filter :authenticate_user!

  def index
    @posts =  Post.page(params[:page])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    if @post.update_attributes(params[:post])
      flash[:success] = t("post.success")
      redirect_to post_url(@post)
    else
      render edit_post_url(@post)
    end
  end

  def show
    @post = Post.find params[:id]
  end

  def create
    @post = Post.new(params[:post])
    @post.user_id = current_user.id

    if @post.save
      flash[:success] = t("post.success")
      redirect_to post_url(@post)
    else
      render :action => "new"
    end

  end

  def destroy
    post = Post.find params[:id]
    post.update_attributes(:status => Post::STATUS_HIDDEN)
    redirect_to posts_url 
  end

end
