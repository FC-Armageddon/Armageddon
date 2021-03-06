class CdsController < ApplicationController

  before_action :authenticate_admin!, only: [:admins_new, :admins_index, :admins_show, :admins_edit, :admins_update, :admins_destroy, :admins_create]
  before_action :cart, only: [:cart_create]
  def admins_new
    @cd = Cd.new
    @discs = @cd.discs.build
    @discs.songs.build
  end

  def index
    # ransackの記載
    @i = 1
    @aaa = Cd.where(deleted_flag: "false")
    @search = @aaa.ransack(params[:q])
    @search_cds = @search.result.page(params[:page]).per(9)
  end

  def search
  end

  def cart_create
      carts = Cart.search_all(params[:id])
      user_carts = carts.where(user_id: current_user.id)
      cart = user_carts.find_by(deleted_flag: "false")

      if cart == nil
         @cart = Cart.new(cart_params)
         @cart.user_id = current_user.id
         @cart.quantity = params[:quantity]
         @cart.save

         respond_to do |format|
          format.js { flash[:notice] = "カートに追加しました。" }
         end
      else
          cart.quantity = cart.quantity.to_i + params[:quantity].to_i
          cd = Cd.find(params[:id])
          if cart.quantity > cd.stock
            respond_to do |format|
              format.js { flash[:notice] = "カート内の商品が在庫数を超えたため入りません 。" }
            end
          else
            cart.save
            respond_to do |format|
              format.js { flash[:notice] = "カートに追加しました。" }
            end
          end
      end
      user_carts = current_user.carts
      carts = user_carts.where(deleted_flag: "false")
      @carts_count = carts.count
  end

  def show
    @cart = Cart.new
    @cd = Cd.find(params[:id])
    @discs = @cd.discs
    @review = Review.new
    @reviews = @cd.reviews
    # ransackの記載
    @search = Cd.ransack(params[:q])
    @search_cds = @search.result
    if @search_cds != Cd.all
      render 'index'
    end
  end

  def admins_index
    @arrival = Arrival.new
    @arrivla_num = nil
    # ransackの記載
    @aaa = Cd.where(deleted_flag: "false")
    @search = @aaa.ransack(params[:q])
    @search_cds = @search.result.page(params[:page]).per(9)
  end

  def admins_show
    @cd = Cd.find(params[:id])
    @discs = @cd.discs
  end

  def admins_edit
    @cd = Cd.find(params[:id])
  end

  def admins_update
        cd = Cd.find(params[:id])
    artist = Artist.search_all(params[:search_artist])
    if  artist ==  nil
      @artist = Artist.new
        @artist.artist = params[:search_artist]
        @artist.save
      cd.artist_id = @artist.id
    else
      cd.artist_id = artist.id
    end
    genre = Genre.search_all(params[:search_genre])
      if genre == nil
        @genre = Genre.new
          @genre.genre = params[:search_genre]
          @genre.save
        cd.genre_id = @genre.id
      else
        cd.genre_id = genre.id
      end
      sales = SalesStatus.search_all(params[:search_sales])
        if sales == nil
          @sales = SalesStatus.new
            @sales.sales_status = params[:search_sales]
            @sales.save
          cd.sales_status_id = @sales.id
        else
          cd.sales_status_id = sales.id
        end
        label = Label.search_all(params[:search_label])
          if label == nil
            @label = Label.new
              @label.label = params[:search_label]
              @label.save
            cd.label_id = @label.id
          else
            cd.label_id = label.id
          end
    cd.update!(cd_params)

    redirect_to cd_admins_path(cd.id)
  end

  def admins_destroy
    cd = Cd.find(params[:id])
    cd.deleted_flag = "true"
    cd.save
    redirect_to cds_admins_path
  end

  def admins_create
    @cd = Cd.new(cd_params)
    artist = Artist.search_all(params[:search_artist])
    if  artist ==  nil
      @artist = Artist.new
      @artist.artist = params[:search_artist]
      @artist.save
      @cd.artist_id = @artist.id
    else
      @cd.artist_id = artist.id
    end
    genre = Genre.search_all(params[:search_genre])
    if genre == nil
      @genre = Genre.new
      @genre.genre = params[:search_genre]
      @genre.save
      @cd.genre_id = @genre.id
    else
      @cd.genre_id = genre.id
    end
    sales = SalesStatus.search_all(params[:search_sales])
    if sales == nil
      @sales = SalesStatus.new
      @sales.sales_status = params[:search_sales]
      @sales.save
      @cd.sales_status_id = @sales.id
    else
      @cd.sales_status_id = sales.id
    end
    label = Label.search_all(params[:search_label])
    if label == nil
      @label = Label.new
      @label.label = params[:search_label]
      @label.save
      @cd.label_id = @label.id
    else
      @cd.label_id = label.id
    end
    @arrival = Arrival.new
    @arrival.arrival = params[:cd][:arrivals][:arrival]
    @cd.stock = @arrival.arrival
    if @cd.save
      @arrival.cd_id = @cd.id
      @arrival.save
      redirect_to cds_admins_path
    else
      render 'cds/admins_new'
    end
  end

  def admins_arrival_create
  end


  def admins_search
  end

  private
  def cd_params
    params.require(:cd).permit(:cd_name, :jacket_image, :price, :stock, :deleted_flag, discs_attributes: [:id, :cd_id, :disc, :sort, :_destroy, songs_attributes: [:id, :disc_id, :song, :song_order, :_destroy]])
  end
  def cart_params
     params.require(:cart).permit(:cd_id, :quantity, :user_id)
  end

  def cart
    if user_signed_in?
    else
     redirect_to new_user_session_path
    end
  end

end

