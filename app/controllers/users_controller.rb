class UsersController < ApplicationController
  def index
    @users = User.all.includes(:posts)
  end

  def show
    @user = User.find_by(username: params[:username])
    if @user
      @posts = @user.posts.includes(:creator, :likes, comments: :commenter)
    end
  end
end
