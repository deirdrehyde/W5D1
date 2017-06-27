class PostsController < ApplicationController

  before_action :require_author_status, only: [:edit, :update]

  def new
    @post = Post.new
    render :new
  end

  def create
    @post.author_id = current_user.id
    @post = Post.create(post_params)

    if @post.save
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    render :edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, :author_id, sub_ids: [] )
  end

  def require_author_status
    @post = Post.find(params[:id])
    redirect_to post_url(@post) unless @post.author_id = current_user.id
  end
end
