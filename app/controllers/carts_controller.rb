class CartsController < ApplicationController
  def index
    @carts = Cart.all
  end

  def create
  end

  def destroy
  end

  def update
  end

  def deleted_flag
  end
end
