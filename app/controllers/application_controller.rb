class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters,  if: :devise_controller?

  after_action :store_location

def store_location
 # 今回の場合は、 /users/sign_in , /users/sign_up, /users/password にアクセスしたとき、ajaxでのやりとりはsessionには保存しない。
    if (request.fullpath != "/users/sign_in" && \
        request.fullpath != "/users/sign_up" && \
        request.fullpath != "/users/password" && \
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath
    end
end

#ログイン後のリダイレクトをログイン前のページにする場合
def after_sign_in_path_for(resource)
  session[:previous_url] || root_path
end

#ログアウト後のリダイレクトをログアウト前のページにする場合
def after_sign_out_path_for(resource)
  session[:previous_url] || root_path
end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :postal_code, :address, :phone_number, :deleted_flag, :profile_image, :first_name, :last_name, :kana_first_name, :kana_last_name])
  end
end
