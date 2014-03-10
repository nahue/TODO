class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end


private
  def current_user

    #if session[:user_id]
    #  if user = User.find(session[:user_id])
    #    @current_user ||= user
    #  else
    #    redirect_to root_path
    #  end
    #else

    #end
    @current_user ||= User.find(session[:user_id]) if session[:user_id]

    rescue ActiveRecord::RecordNotFound
      session[:user_id] = nil
      flash[:notice] = "Su sesió+n expiró"
      redirect_to root_path

  end
  helper_method :current_user

  def authorize
    redirect_to login_url if current_user.nil?
  end
end
