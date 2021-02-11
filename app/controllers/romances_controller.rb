class RomancesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_romance, only: %i[ show edit update destroy ]


  def index
    #@romances = Romance.order('created_at DESC')
    @romances = Romance.page(params[:page]).per(2).order('created_at DESC')
  end

  def show
    
    @comment = Comment.new
    @comments = @romance.comments.includes(:user).order('created_at DESC')
  end

  def new
    @romance = Romance.new
  end

  def create
    @romance = Romance.new(romance_params)

    # --------------------------------------------------------------

    # 以下の1行を追記
    @romance.user_id = current_user.id

    respond_to do |format|
      if @romance.save
        format.html { redirect_to @romance, notice: "Romance was successfully created." }
        format.json { render :show, status: :created, location: @romance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @romance.errors, status: :unprocessable_entity }
      end
    end
    # --------------------------------------------------------------

  end



  def destroy
    
    @romance.destroy
    respond_to do |format|
      format.html { redirect_to romances_url, notice: "Romance was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  def edit
  end

  def update
    

    if @romance.update(romance_params_update)
      #binding.pry
      redirect_to romance_path(@romance.id)
    else
      render :edit
    end
  end


  def search
    #@romances = SearchRomancesService.search(params[:keyword])

    # キーワード分割
    keywords = params[:keyword].split(/[[:blank:]]+/).select(&:present?)
    #binding.pry
    # 空のモデルオブジェクト作成（何も入っていない空配列のようなもの）
    @romances = Romance.none
    #binding.pry

    # 検索ワードの数だけor検索を行う
    keywords.each do |keyword|
      #binding.pry
      #keyword = keyword.tr('〇一二三四五六七八九', '0123456789').gsub(/(\d+)?十(\d+)?/) { ($1 || 1).to_i * 10 + $2.to_i }
      @romances = @romances.or(Romance.where("title LIKE ?", "%#{keyword}%"))
    end

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

  def set_romance
    @romance = Romance.find(params[:id])
  end


  def romance_params_update
    params.require(:romance).permit(:image, :title, :info1)
  end

end