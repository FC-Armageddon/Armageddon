class CartsController < ApplicationController

  protect_from_forgery :except => [:update]

  before_action :authenticate_user!

  def index
    carts_user = current_user.carts
    @carts = carts_user.where(deleted_flag: "false")
    if @carts == []
      redirect_to root_path, notice: "カートの中身がありません"
    end
  end

  def destroy
    cart = Cart.find(params[:id])
    cart.destroy
    redirect_to carts_path
  end

  def update
    cart = Cart.find(params[:id])
    cart.quantity = params[:update_quantity]
    if cart.update(cart_update_params)
       flash[:notice] = "数量変更しました。"
       redirect_to carts_path
    else
       render("carts/index")
    end
  end

  private
   def cart_update_params
    params.permit(:quantity)
  end
end
