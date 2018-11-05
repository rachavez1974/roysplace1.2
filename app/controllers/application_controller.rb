class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   include SessionsHelper
  
  # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to user_login_url
      end
    end

     # Confirms an admin user.
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end



   #Testing routes  
  def home
    render html: "Previet!"
  end
end
