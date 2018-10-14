class UsersController < ApplicationController
  def new
    @user = User.new()
    @user.addresses.build
  end

  def show
    @user = User.find(params[:id])
  end

  def create  
    @user = User.new(user_params)
    respond_to do |format|   
      if@user.save  
        #flash[:success] = "Welcome to Roy's Place!"
        format.html { redirect_to @user, notice: 'Welcome to Roy\'s Place!' }
        format.js
        format.json { render json: @user, status: :created, location: @user }
        #redirect_to @user
      else
        #render 'new'
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end 



  private
  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :phone_number, 
     :birth_day, :email, :password, :password_confirmation,
     :text_club, :email_club, :terms, :addresses_attributes => [:id, :street_address, :address_type, :unit_type, :city, :state,
      :zipcode, :number, :user_id])
  end
end
