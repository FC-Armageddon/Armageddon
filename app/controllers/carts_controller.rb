class CartsController < ApplicationController

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
    if @cart.update(cart_params)
       redirect_to buy_infomations_path
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
end
