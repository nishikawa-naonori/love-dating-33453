class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    if comment.save
      redirect_to "/romances/#{comment.romance.id}"  # コメントの完了後の遷移
    else
      redirect_to "/romances/#{comment.romance.id}"  # コメントの完了後の遷移
    end
  end



  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, romance_id: params[:romance_id])
  end
end
