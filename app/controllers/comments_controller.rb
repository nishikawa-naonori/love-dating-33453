class CommentsController < ApplicationController
  def create
    comment = Comment.create!(comment_params)
    #  redirect_to "/loves/#{comment.love.id}"  # コメントと結びつく投稿の詳細画面に遷移する
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, lofe_id: params[:love_id])
  end
end
