class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy, :show]
  before_action :correct_user,   only: [:show, :edit, :update, :destroy]
  before_action :already_a_user, only: [:new, :create]



  def new
    @user = User.new()
    @user.addresses.build
  end 

  def show
    @user = User.find(params[:id])
  end

  def create

    @user = User.new(user_params)
      if@user.save
        log_in @user 
        flash[:success] = "Welcome to Roy's Place!" 
        redirect_to @user
      else
        render 'new'     
      end
  end 

  def edit
  end

  def update
      if @user.update_attributes(user_params)
       flash[:success] = "#{@user.first_name}, your profile was updated successfully!"
       redirect_to @user
      else
        render 'edit'
      end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private
  def user_params
              params.require(:user).permit(:id, :first_name, :last_name, :phone_number, 
                :birth_day, :email, :password, :password_confirmation,
                :text_club, :email_club, :terms, :addresses_attributes => [:id, :street_address, :address_type, :unit_type, :city, :state,
                :zipcode, :number, :user_id])
  end

# Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      if current_user?(@user)
        return
      else
         flash[:danger] = "You're not the right user."
      redirect_to(root_url)
      end
      # unless current_user?(@user)
    end
  
  def already_a_user
      if logged_in?
        flash[:danger] = "You're already a user."
        redirect_to current_user
      end
  end


end
