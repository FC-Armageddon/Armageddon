class ArrivalsController < ApplicationController
  def create
  	arrival = Arrival.new(arrival_params)
  	arrival.save
  	cd = Cd.find(arrival.cd_id)
  	cd.stock = cd.stock + arrival.arrival
  	cd.save
  	redirect_to cd_admins_path(cd.id)
  end

  def index
  end

  private
  def arrival_params
  	params.require(:arrival).permit(:arrival, :cd_id)
  end
end