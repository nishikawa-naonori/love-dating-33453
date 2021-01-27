class LovesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @loves = Love.order('created_at DESC')
  end

  def new
    @love = Love.new
  end

  def create
    @love = Love.new(love_params)
    if @love.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @love = Love.find(params[:id])
    @comment = Comment.new
    @comments = @love.comments.includes(:user)
  end

  private

  def love_params
    params.require(:love).permit(:image, :title, :info1).merge(user_id: current_user.id)
  end

end