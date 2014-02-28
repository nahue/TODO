class SessionsController < ApplicationController

  layout "layouts/login"

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Bienvenido!"
    else
      flash.now.alert = "Email o Password invalido"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Adios!"
  end

end
