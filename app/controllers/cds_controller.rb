class CdsController < ApplicationController
  def admins_new
    @cd = Cd.new
    @discs = @cd.discs.build
    @discs.songs.build
  end

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
    artist = Artist.search_all(params[:search_artist])
    if  artist ==  nil
      @artist = Artist.new(artist_params)
        @artist.artist = params[:search_artist]
        @artist.save
      cd.artist_id = @artist.id
    else
      cd.artist_id = artist.id
    end
    genre = Genre.search_all(params[:search_genre])
      if genre == nil
        @genre = Genre.new(genre_params)
          @genre.genre = params[:search_genre]
          @genre.save
        cd.genre_id = @genre.id
      else
        cd.genle = genre.id
      end
      sales = Sales_status.search_all(params[:search_sales])
        if sales == nil
          @sales = Sales_status.new(sales_params)
            @sales.sales_status = params[:search_sales]
            @sales.save
          cd.sales_status_id = @sales.id
        else
          cd.sales_status_id = sales.id
        end
        label = Label.search_all(params[:search_label])
          if label == nil
            @label = Label.new(label_params)
              @label.label = params[:search_label]
              @label.save
            cd.label_id = @label.id
          else
            cd.label_id = label.id
          end
    arrival = Arrival.new(arrival_params)
    arrival.save
    cd.stock = arrival.arrival
    cd.save
  end


  def admins_search
  end

  private
    def cd_params
      params.require(:cd).permit(:cd_name, :jacket_image, :price, :stock, discs_attributes: [:id, :cd_id, :disc, :sort, songs: [:id, :disc_id, :song, :song_order]])
    end
    def artist_params
      params.require(:artist).permit(:artist)
    end
    def genre_params
      params.require(:genre).permit(:genre)
    end
    def sales_params
      params.require(:sales_status).permit(:sales_status)
    end
    def label
      params.require(:label).permit(:label)
    end
    def arrival
      params.require(:arrival).permit(:arrival)
    end
  end
