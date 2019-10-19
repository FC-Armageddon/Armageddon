class ArrivalsController < ApplicationController

  before_action :authenticate_admin!

def create
  	arrival = Arrival.new(arrival_params)
  	arrival.save!
  	cd = Cd.find(arrival.cd_id)
    if cd.sales_status.sales_status == "販売中"
  	cd.stock = cd.stock + arrival.arrival
    if cd.stock <= 0
      sales = SalesStatus.find_by(sales_status: "販売停止中")
      cd.sales_status_id = sales.id
    end
  else
    if cd.stock <= 0
      cd.stock = cd.stock + arrival.arrival
      if cd.stock >= 1
        sales = SalesStatus.find_by(sales_status: "販売中")
        cd.sales_status_id = sales.id
      end
    else
      cd.stock = cd.stock + arrival.arrival
    end
  end
    cd.save!
    redirect_to cd_admins_path(cd.id)
  end

  def index
    @arrivals = Arrival.all
  end

  private
  def arrival_params
  	params.require(:arrival).permit(:arrival, :cd_id)
  end
end