class FollowsController < ApplicationController
    before_action :authenticate_user!
    def create
        @user = User.find_by(username: params[:user_username])
        if @user
            @follow = @user.followers_list.build(follower: current_user)
            if @follow.save
                render partial: "follow", locals: { user: @user }, status: :ok
            else
                render partial: "follow", locals: { user: @user }, status: :unprocessable_entity
            end
        else
            head(:unprocessable_entity)
        end
    end

    def destroy
        @follow = Follow.find(params[:id])
        if @follow && (@follow.follower == current_user || @follow.following == current_user)
            if @follow.destroy
                if @follow.follower == current_user
                    render partial: "follow", locals: { user: @follow.following }, status: :ok
                else
                    render partial: "request", locals: { user: @follow.follower }, status: :ok
                end
            else
                head(:unprocessable_entity)
            end
        else
            head(:unprocessable_entity)
        end
    end

    def update
        @follow = Follow.find(params[:id])
        if @follow && @follow.following == current_user
            if @follow.accepted!
                render partial: "request", locals: { user: @follow.follower }, status: :ok
            else
                head(:unprocessable_entity)
            end
        else
            head(:unprocessable_entity)
        end
    end
end
