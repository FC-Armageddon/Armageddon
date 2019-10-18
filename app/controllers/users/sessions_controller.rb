# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action taikai:
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

    def after_sign_in_path_for(resource)
     if session[:album_id] == nil
        root_path
    else
        aa = session[:album_id]
        cd_path(aa)
    end

    end
    def after_sign_out_path_for(resource)
          root_path
    end
    def taikai
        @user = User.find(params[:email,:encrypted_password])
        if @user.deleted_flag
        redirect_to new_user_session_path
        end
    end
end
