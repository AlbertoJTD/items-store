class Authentication::SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by("email = :login OR username = :login", { login: params[:login] })

    if @user&.authenticate(params[:password_digest])
      redirect_to products_path, notice: t('.created')
    else
      redirect_to new_session_path, alert: t('.failed')
    end
  end

  # private

  # def session_params
  #   params.require(:user).permit(:email, :username, :password_digest)
  # end
end
