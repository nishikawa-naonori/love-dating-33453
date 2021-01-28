class RomancesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @romances = Romance.order('created_at DESC')
  end

  def new
    @romance = Romance.new
  end

  def create
    @romance = Romance.new(romance_params)
    if @romance.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @romance = Romance.find(params[:id])
    @comment = Comment.new
    @comments = @romance.comments.includes(:user).order('created_at DESC')
  end

  def destroy
    @romance = Romance.find(params[:id])
    @romance.destroy
    redirect_to root_path
  end


  private

  def romance_params
    params.require(:romance).permit(:image, :title, :info1).merge(user_id: current_user.id)
  end

end