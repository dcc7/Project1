class CommentsController < ApplicationController
  def create
    @comment = Comment.new comment_params
    @comment.account_id = current_account.id

    respond_to do |format|
      format.js {
        if @comment.save
          @comments = Comment.where(post_id: @comment.post_id)
          render "comments/create"
        else
          #if it can't save
        end
      }
    end
  end

  def comment_params
    params.require(:comment).permit(:message, :post_id)
  end

  def destroy
    comment = Comment.find (params[:id])
    comment.destroy
    redirect_to community_post_path(comment.id)
  end

  

end
