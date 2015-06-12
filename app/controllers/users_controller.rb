class UsersController < ApplicationController
   def index
    @users = User.order('created_at DESC').(page: params[:page], per_page: 30)
  end
end
