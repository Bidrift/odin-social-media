class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  before_action only: [:create, :update] do
    authorize_user(post_params[:creator_id])
  end
  before_action only: [:destroy, :edit] do
    authorize_user(Post.find(params[:id]).creator.id)
  end
  
  def index
    @posts = Post.includes(:likes).includes(:likers).includes(comments: [commenter: :profile]).includes(creator: :profile).all.reverse
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
    authorize_user(@post.creator_id)
    if @post.destroy
      flash['success'] = 'Post deleted successfully'
      redirect_to posts_path
    else
      head(:unprocessable_entity)
    end
  end

  def edit
    @post = Post.find(params[:id])
    authorize_user(@post.creator_id)
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
    @comments = @post.comments.includes(:users)
  end

  private

  def post_params
    params.expect(post: [:creator_id, :body])
  end
end
