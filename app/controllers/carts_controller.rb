class CartsController < ApplicationController

protect_from_forgery :except => [:update]
  def index
    @carts = current_user.carts
  end

  def create
    cart = Cart.new(cart_params)
    cart.user_id = current_user.id
    cart.save
    redirect_to carts_path
  end

  def destroy
  end

  def update
    @cart = Cart.find(params[:id])
    @cart.quantity = params[:update_quantity]
    if @cart.update(cart_update_params)
       redirect_to carts_path
    else
       render("carts/index")
    end
  end

  def deleted_flag
  end
  private
  def cart_params
     params.require(:cart).permit(:cd_id, :quantity, :user_id)
   end
   def cart_update_params
    params.permit(:quantity)
  end
end
