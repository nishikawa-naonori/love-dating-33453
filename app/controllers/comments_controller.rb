class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    # binding.pry
    if @comment.save
      redirect_to "/romances/#{@comment.romance.id}" # コメントの完了後の遷移
    else

      @romance = Romance.find(params[:romance_id])
      @comments = @romance.comments.includes(:user).order('created_at DESC')
      # @comments = @romance.comments.order('created_at DESC')
      # binding.pry
      # redirect_to "/romances/#{@comment.romance.id}"  # コメントの完了後の遷移
      render 'romances/show' # views/tweets/show.html.erbのファイルを参照しています。

    end
  end

  def show
    @comment = Comment.find(params[:id])
    # @comments = @comment.romance.includes(:user).order('created_at DESC')
  end

  def edit
    @romance = Romance.find(params[:romance_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params_update)
      redirect_to "/romances/#{@comment.romance.id}"
    else
      render :edit
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    #@comment.destroy
    render 'romances/show'
    #redirect_to "/romances/#{romance.id}"
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, romance_id: params[:romance_id])
  end

  def comment_params_update
    params.require(:comment).permit(:text)
  end
end
