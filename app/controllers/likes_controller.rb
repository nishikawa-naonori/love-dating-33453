class LikesController < ApplicationController
  before_action :romance_params
  # binding.pry
  def create
    #binding.pry
    Like.create(user_id: current_user.id, romance_id: params[:id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    #binding.pry
    Like.find_by(user_id: current_user.id, romance_id: params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def romance_params
    @romance = Romance.find(params[:id])
  end


  # def create
  #   @like = current_user.likes.create(romance_id: params[:romance_id])
  #   redirect_back(fallback_location: root_path)    #いいね、した時に戻る
  # end

  # def destroy
  #   @like = Like.find_by(romance_id: params[:romance_id], user_id: current_user.id)
  #   @like.destroy
  #   redirect_back(fallback_location: root_path)
  # end


#sssssssssssssssssssssssssssssssss


  #def create
   #  Like.create(user_id: current_user.id, romance_id: params[:romance_id])
    # @likes = Like.where(romance_id: params[:romance_id])
    # @romances = Romance.all
  
  #end

  # def destroy
  #   #binding.pry
  #   like = Like.find_by(user_id: current_user.id, romance_id: params[:romance_id])
  #   like.destroy
  #   @likes = Like.where(romance_id: params[:romance_id])
  #   @romances = Romance.all
  # end
  
end
