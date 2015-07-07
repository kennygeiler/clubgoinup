class SessionsController < ApplicationController

  def create
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to profile_path
    else
      flash[:error] = "Bad username or password"
      redirect_to signin_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
