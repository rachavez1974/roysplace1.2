class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user 
  before_action :admin_user
  layout "admin"

  def new
    @item = Item.new
  end

  def show
  end 

  def create
    @item = Item.new(item_params)
      if @item.save
        flash[:success] = "The following item was successfully added to menu!"
        redirect_to @item
      else
        render 'new'
      end
  end

  def edit
  end

  def update
    if @item.update_attributes(item_params)
       flash[:success] = "#{@item.item_name} information was updated successfully!"
       redirect_to @item
      else
        render 'edit'
      end
    
  end

  private
  def item_params
    params.require(:item).permit(:id, :item_name, :description, :price, 
                                  :modifiers, :section, :menu, :availability)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to admin_login_url
      end
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
