class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :authorize_user, only: [:create, :update]
  
  def index
    @posts = Post.includes(:creator).all.reverse
    if user_signed_in?
      @post = current_user.posts.build()
    end
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash['success'] = "Post created successfully"
      redirect_to posts_path
    else
      head(:unprocessable_entity)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    unless authorize_user(@post.creator_id)
      index
    end
    if @post.destroy
      flash['success'] = 'Post deleted successfully'
      redirect_to posts_path
    else
      head(:unprocessable_entity)
    end
  end

  def edit
    @post = Post.find(params[:id])
    unless authorize_user(@post.creator_id)
      index
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash['success'] = "Post updated successfull"
      redirect_to post_path(@post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def authorize_user(param=post_params[:creator_id])
    unless current_user.id == param.to_i
      flash['alert'] = "You are not allowed to perform this action"
      head(:unauthorized)
      return false
    end
    true
  end

  def post_params
    params.expect(post: [:creator_id, :body])
  end
end
