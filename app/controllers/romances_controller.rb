class RomancesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]



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
    @like = Like.new
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
    @romances = SearchRomancesService.search(params[:keyword])
  end

  def checked

    comment = Comment.find(params[:id])

    # commentテーブルのカラム  値があるか？
    
    if comment.checked 
      comment.update(checked: false)
    else
      comment.update(checked: true)
    end

    item = Comment.find(params[:id])
    render json: { comment: item }
  end


  private

  def romance_params
    params.require(:romance).permit(:image, :title, :info1).merge(user_id: current_user.id)
  end

  def romance_params_update
    params.require(:romance).permit(:image, :title, :info1)
  end


end