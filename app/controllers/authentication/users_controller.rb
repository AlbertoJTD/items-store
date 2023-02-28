class Authentication::UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password_digets)
  end
  
end
