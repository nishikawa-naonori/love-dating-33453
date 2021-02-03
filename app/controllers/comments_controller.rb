class CommentsController < ApplicationController
  def create
   # comment = Comment.create(comment_params)
    @comment = Comment.new(comment_params)
    #binding.pry
    if @comment.save
      redirect_to "/romances/#{@comment.romance.id}"  # コメントの完了後の遷移
    else
    #  @comment = Comment.find(params[:id])
      @romance = Romance.find(params[:romance_id])
      #@comment = Comment.new
      @comments = @romance.comments.includes(:user).order('created_at DESC')
      render "romances/show" # views/tweets/show.html.erbのファイルを参照しています。

      # redirect_to "/romances/#{comment.romance.id}"  # コメントの完了後の遷移
    #  @prototype = @comment.prototype
     # @comments = @prototype.comments
    #  render "prototypes/show" # views/tweets/show.html.erbのファイルを参照しています。
     
    end
  end

  def show
    @comment = Comment.find(params[:id])
   # @comments = @comment.romance.includes(:user).order('created_at DESC')
    
  end

  def edit
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
    @comment = Comment.find(params[:id])
    @comment.destroy
    #render :show
    redirect_to "/romances/#{@comment.romance.id}"
  end






  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, romance_id: params[:romance_id])
  end

  def comment_params_update
    params.require(:comment).permit(:text)
  end

end
