class BuyInformationsController < ApplicationController
  

  def new
  	carts = current_user.carts
    @carts = carts.where(deleted_flag: "false")
  	@buy_information = BuyInformation.new
  	@destinations = current_user.destinations
    if @carts == []
      redirect_to root_path
    end
  end

  def create
    carts = current_user.carts
    @carts = carts.where(deleted_flag: "false")
    i = 0
    @stock_nil = []
    @carts.each do |cc|
      s = cc.cd.stock.to_i - cc.quantity.to_i
      if s < 0
        i += 1
        @stock_nil << cc.cd
      end
    end

    if i == 0
  	buy = BuyInformation.new(buy_information_params)
  	buy.user_id = current_user.id
  	if params[:destination_id] == "a"
  		buy.final_postal_code = current_user.postal_code
  		buy.final_address = current_user.address
  		buy.final_name = current_user.first_name
  	else
  		destination = Destination.find(params[:destination_id])
  		buy.final_postal_code = destination.delivery_postal_code
  		buy.final_address = destination.delivery_address
  		buy.final_name = destination.delivery_name
  	end
  	buy.save
  		@carts.each do |c|
  			c.deleted_flag = true
  			c.save
  			stock = c.cd.stock.to_i - c.quantity.to_i
  			c.cd.stock = stock
          if c.cd.stock <= 0
            sales = SalesStatus.find_by(sales_status: "販売停止中")
            c.cd.sales_status_id = sales.id
          end
  			c.cd.save
  			history = PurchaseHistory.new(purchase_history_params)
  			history.buy_information_id = buy.id
  			history.cd_name = c.cd.cd_name
  			history.price = c.cd.price
  			history.save
  		end
  	 redirect_to user_path(current_user.id)
    else
      flash.now[:danger] = '以下の商品の在庫が足りないため購入が出来ません。<br>購入数を減らすか、カートから削除して下さい。'
      render 'carts/index'
    end

  end

  def updates
  end

  private
  def buy_information_params
  	params.require(:buy_information).permit(:user_id, :payment, :subtotal, :final_postal_code, :final_address, :final_name)
  end
  def purchase_history_params
  	params.permit(:buy_informations_id, :cd_name, :price)
  end
end