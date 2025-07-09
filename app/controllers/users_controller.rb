class UsersController < ApplicationController
  def index
    @users = User.all.includes(:posts).includes(:followers_list, :followings_list).includes(:profile)
  end

  def show
    @user = User.includes(posts: [ :creator, :likes, :likers, comments: [ commenter: :profile ] ]).find_by(username: params[:username])
    if @user
      @posts = @user.posts
    end
  end
end
