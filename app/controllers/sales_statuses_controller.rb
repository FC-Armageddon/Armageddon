class SalesStatusesController < ApplicationController
  def create
  	sales_statuse = Sales_statuse.new
  	sales_statuse.save
  end

  def update
  end
end
