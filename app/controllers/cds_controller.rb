class CdsController < ApplicationController
  def index
  end

  def search
  end

  def show
  end

  def admins_index
  end

  def admins_show
  end

  def admins_edit
  end

  def admins_update
  end

  def admins_destroy
  end

  def admins_create
    cd = Cd.new(cd_params)
    cd.artist_id = Artist.find(params[:id])
    cd.genre_id = Genre.find(params[:id])
    cd.label_id = Label.find(params[:id])
    cd.sales_status_id = Sales_status.find(params[:id])
    cd.save
    redirect_to cd_admins_path
  end

  def admins_new
    @cd = Cd.new
    @discs = @cd.discs.build
    @discs.songs.build
  end

  def admins_search
  end

  private

  def cd_params
    params.require(:cd).permit(:cd_name, :jacket_image, :price, :stock, discs_attributes: [:id, :cd_id, :disc, :sort, songs: [:id, :disc_id, :song, :song_order]])
  end
end
