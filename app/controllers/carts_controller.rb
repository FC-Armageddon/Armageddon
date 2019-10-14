class CartsController < ApplicationController
  def index
    @carts = Cart.all
  end

  def create
    cart = Cart.new(cart_params)
    cart.user_id = current_user.id
    cart.save
  end

  def destroy
  end

  def update
  end

  def deleted_flag
  end
  private
  def cart_params
     params.require(:cart).permit(:cd_id, :quantity, :user_id)
   end
end
