class ApplicationController < ActionController::Base

  protect_from_forgery

  helper_method :current_user
  helper_method :correct_user?

  private

  def require_oauthed_user!
    sign_out("You must sign in with a valid google account to use this app") unless current_user.present?
  end

  def sign_out(notice)
    session[:user_id] = nil
    redirect_to root_url, :notice => notice
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def correct_user?
    @user = User.find(params[:id])
    unless current_user == @user
      redirect_to root_url, :alert => "Access denied."
    end
  end

end
