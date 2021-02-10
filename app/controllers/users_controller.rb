class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def check
    users = User.pluck('email')
    render json: { users: users }
  end
end
