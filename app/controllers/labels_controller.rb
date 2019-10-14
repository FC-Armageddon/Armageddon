class LabelsController < ApplicationController
  def create
  	label = Label.new
  	label.save
  end

  def update
  end

  private
  def label_params
  	params.require(:label).permit(:label)

  end
end
