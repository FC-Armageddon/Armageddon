class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:show, :edit, :deleted_flag]
  before_action :authenticate_admin!, only: [:admins_index, :admins_show, :admins_edit, :admins_deleted_flag]

  def update
    @user = User.find(params[:id])
    if admin_signed_in?
      if @user.update(user_params)
        flash[:notice] = "You have updated user successfully."
        redirect_to user_admins_path(@user.id)
      else
        render("users/admins_edit")
      end
    elsif user_signed_in?
      if @user != current_user
        redirect_to root_path
      else
        if @user.update(user_params)
          flash[:notice] = "You have updated user successfully."
          redirect_to user_path(@user.id)
        else
          render("users/edit")
        end
      end
    else
      redirect_to new_user_session
    end
  end

  def show
    @user = User.find(params[:id])
    @destinations = @user.destinations
    carts = current_user.carts
    @buy_information = @user.buy_informations

    if @user.id != current_user.id
      redirect_to root_path
    # これで退会済みユーザーはuser/[:id]を手打ちしても見れない
    elsif @user.deleted_flag.to_s == "true"
        flash[:notice] = "あなたは退会済みユーザーです。"
        redirect_to new_user_registration_path

    end
  end

  # userのshowで削除機能つけなければいらない
  # def destroy
  #   destination = Destination.find(params[:id])
  #   destination.destroy
  #   redirect_to user_path(current_user.id)
  # end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
       redirect_to root_path
    end
  end

  def deleted_flag
    @user = User.find(params[:id])
    if @user != current_user
       redirect_to root_path
    end
    @user.deleted_flag = true
    # updateでもできるらしいけど、updateの時はストロングパラメータから取ってくる記述いる
    @user.save
    reset_session
    redirect_to root_path
  end

  def admins_index
    @users = User.where(deleted_flag: "false").page(params[:page]).per(9)
  end

  def admins_show
    @user = User.find(params[:id])
    @destinations = @user.destinations


    # @purchase_historises = Purchase_history.all
    @cd = Cd.find(params[:id])
    @buy_information = @user.buy_informations
    @carts = @user.carts.where(deleted_flag: "true")

  end

  def admins_edit
    @user = User.find(params[:id])
  end

  def admins_update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "OK!!!"
       redirect_to user_admins(@user_admins.id)
    else
      render("users/admins_edit")
    end
  end

  def admins_deleted_flag
    @user = User.find(params[:id])
    @user.deleted_flag = true
    @user.save
    redirect_to users_admins_path
  end

private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :postal_code, :address, :email, :profile_image, destinations_attributes: [:id, :delivery_postal_code, :delivery_address, :delivery_name, :_destroy])
  end
end
