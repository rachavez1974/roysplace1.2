class SessionsController < ApplicationController
  layout 'admin', only: [:new_admin, :create_new_admin]

  def new_admin
    
  end

  def new_user 
    
  end

  def create_new_admin
    @user = User.find_by(email: params[:session][:email].downcase)
      if @user && @user.admin? && @user.authenticate(params[:session][:password]) 
          log_in(@user)
          params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
          flash[:success] = "Welcome back #{@user.first_name}"   
          redirect_to admin_dashboard_url
      else
        flash.now[:danger] = 'Invalid email/password combination for admins' 
        render 'new_admin'
      end
  end

  def create_new_user
    @user = User.find_by(email: params[:session][:email].downcase)
      if @user && @user.authenticate(params[:session][:password])  
          log_in(@user)
          params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
          flash[:success] = "Welcome back #{@user.first_name}"   
          redirect_to @user
      else
          flash.now[:danger] = 'Invalid email/password combination'
          render  'new_user'
      end    
  end

  def destroy
     
    if current_user.admin
    log_out if logged_in?
      redirect_to admin_dashboard_url
    else
      log_out if logged_in?
      redirect_to root_url
    end
  end

end
