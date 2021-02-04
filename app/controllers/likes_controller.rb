class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(romance_id: params[:romance_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(romance_id: params[:romance_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end


  # def create
  #   @like = Like.create(user_id: current_user.id, romance_id: params[:romance_id])
  #   @likes = Like.where(romance_id: params[:romance_id])
  #   @romances = Romance.all
  # end

  # def destroy
  #   like = Like.find_by(user_id: current_user.id, romance_id: params[:romance_id])
  #   like.destroy
  #   @likes = Like.where(romance_id: params[:romance_id])
  #   @romances = Romance.all
  # end
  
end
