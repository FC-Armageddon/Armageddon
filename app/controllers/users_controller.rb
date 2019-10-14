class UsersController < ApplicationController
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def deleted_flag
    @user = User.find(params[:id])
    @user.deleted_flag = true
    # updateでもできるらしいけど、ストロングパラメータから取ってくる記述してね
    @user.save
    redirect_to root_path
  end

  def admins_index
    @users = User.all
  end

  def admins_show
    @user = User.find(params[:id])
    @buy_infomations = Buy_infomations.all
  end

  def admins_edit
    @user = User.find(params[:id])
  end

  def admins_update
  end

  def admins_deleted_flag
    @user = User.find(paarams[:id])
    @user.deleted_flag = true
    @user.save
    redirect_to users_admins_path
  end

private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :postal_code, :address, :email, :profile_image,)
  end
end
