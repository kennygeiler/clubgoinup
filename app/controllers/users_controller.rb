class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to new_quote_path
    else
      redirect_to new_user_path
    end
  end
  def index
    @users = User.order('created_at DESC').(page: params[:page], per_page: 30)
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
