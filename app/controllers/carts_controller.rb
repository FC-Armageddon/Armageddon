class CartsController < ApplicationController

protect_from_forgery :except => [:update]
  def index
    @carts = current_user.carts
  end

  def create
    if user_signed_in?
       cart = Cart.new(cart_params)
       cart.user_id = current_user.id
       cart.quantity = params[:quantity]
       cart.save
       flash[:notice] = "カートに追加しました。"
       redirect_to cd_path(cart.cd_id)
    else
      cart = Cart.new(cart_params)
      session[:album_id] =  cart.cd_id
      redirect_to new_user_session_path
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
