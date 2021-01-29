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


  def edit
    @romance = Romance.find(params[:id])
  end

  def update
    @romance = Romance.find(params[:id])

    if @romance.update(romance_params_update)
      #binding.pry
      redirect_to romance_path(@romance.id)
    else
      render :edit
    end
  end

  def search
    @romances = SearchTweetsService.search(params[:keyword])
  end

  private

  def romance_params
    params.require(:romance).permit(:image, :title, :info1).merge(user_id: current_user.id)
  end

  def romance_params_update
    params.require(:romance).permit(:image, :title, :info1)
  end


end