class CommentsController < ApplicationController
    def create
        comment = Comment.new(comment_params)
        comment.save
        redirect_to commercial_path(params[:comment][:commercial_id])
    end

    def destroy
        Comment.find(params[:id]).destroy
        redirect_to commercial_path(params[:commercial_id])
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :user_id, :commercial_id)
    end
end
