class BuyInformationsController < ApplicationController
  
  def new
  	@carts = current_user.carts
  	@buy_information = BuyInformation.new
  end

  def create
  end

  def updates
  end
end
