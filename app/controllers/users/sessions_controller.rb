# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
   before_action :taikai, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private
    def after_sign_out_path_for(resource)
          root_path
    end
    def taikai
        @user = User.find_by(email: params[:user][:email], deleted_flag: true)
        # binding.pry
        if @user
        reset_session
        flash[:notice] = "あなたは退会済みユーザーです。サインアップしてください。"
        redirect_to new_user_registration_path
        end
    end
end
