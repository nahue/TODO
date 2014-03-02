class UsersController < ApplicationController
  layout "layouts/login"

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Gracias por registrarse"
    else
      render "new"
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :firstname, :lastname)
  end

end
