class DiscsController < ApplicationController
  def create
  end

  def update
  end

  def destroy
  disc = disc(params[:id])
  disc.destroy
  redirect_to cd_admins_edit_path(current_admin.id)
  end
end
