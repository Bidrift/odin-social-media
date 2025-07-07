class LikesController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @post.likers << current_user unless @post.likes.include? current_user
        render partial: 'like', locals: { post: @post }, status: :ok
    end

    def destroy
        @like = Like.find([current_user.id, params[:post_id]])
        if @like.destroy
            render partial: 'like', locals: { post: @like.liked_post }, status: :ok
        else
            head(:unprocessable_entity)
        end
    end
end
