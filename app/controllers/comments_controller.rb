class CommentsController < ApplicationController
    before_action :authenticate_user!

    before_action only: [:create, :update] do
        authorize_user(comment_params[:commenter_id])
    end
    before_action only: [:destroy] do
        comment = Comment.find(params[:id])
        authorize_user(comment.commenter.id, comment.post.creator.id)
    end

    before_action only: [:edit] do
        comment = Comment.find(params[:id])
        authorize_user(comment.commenter.id)
    end

    def create
        @comment = Comment.new(comment_params)
        respond_to do |format|
            if @comment.save
                format.turbo_stream
            else
                head(:unprocessable_entity)
            end
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        respond_to do |format|
            if @comment.destroy
                format.turbo_stream
            else
                head(:unprocessable_entity)
            end
        end
    end

    def edit
        @comment = Comment.find(params[:id])
        render turbo_stream: turbo_stream.update("comment-"+@comment.id.to_s, partial: 'form', locals: { comment: @comment })
    end

    def update
        @comment = Comment.find(params[:id])
        respond_to do |format|
            if @comment.update(comment_edit_params)
                format.turbo_stream { render turbo_stream: turbo_stream.update("comment-"+@comment.id.to_s, @comment)}
            else
                head(:unprocessable_entity)
            end
        end
    end

    private

    def comment_params
        params.expect(comment: [:post_id, :commenter_id, :body])
    end

    def comment_edit_params
        params.expect(comment: [:body])
    end
end
