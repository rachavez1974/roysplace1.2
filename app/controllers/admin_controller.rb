class AdminController < ApplicationController
  # before_action :logged_in_user
  # before_action :correct_user, :admin_user
layout "admin"
  def new
  end

  def dashboard 
  end

  def show_customer
    @user = User.find(params[:id])
  end

  def new_user_form
    @user = User.new()
    @user.addresses.build
  end

  def create_new_customer

    @user = User.new(customer_params)
    # #Skip validations for uncessary fields when calling or ordering in-store
     if@user.save(validate: false)
      #debugger
      redirect_to :action => 'show_customer', :id => @user.id
      
    else
      render 'new_user_form'
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private
    def customer_params
      params.require(:user).permit(:id, :first_name, :last_name, :phone_number, 
                                   :addresses_attributes => [:id, :street_address, :address_type,
                                   :unit_type, :city, :state, :zipcode, :number, :user_id])
    end


end
