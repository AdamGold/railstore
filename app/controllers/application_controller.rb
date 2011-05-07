class ApplicationController < ActionController::Base
  add_crumb("RailsDepot", '/')
  protect_from_forgery
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def login_required
    unless current_user
      redirect_to root_url, :notice => "Unfortunately you can't access this page since you're not signed in."
    end
  end
  
  def admin_required
    if ! current_user
      redirect_to root_url, :notice => "Unfortunately you can't access this page since you're not an admin."
    else
      unless current_user.is_admin
        redirect_to root_url, :notice => "Unfortunately you can't access this page since you're not an admin."
      end
    end
  end
end
