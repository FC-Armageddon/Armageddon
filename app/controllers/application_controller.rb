class ApplicationController < ActionController::Base
	  before_action :configure_permitted_parameters,  if: :devise_controller?
	  before_action :store_user_location!, if: :storable_location?
    before_action :carts_count
	  def after_sign_in_path_for(resource_or_scope)
		stored_location_for(resource_or_scope) || root_path
	  end

    def carts_count
      if user_signed_in?
        user_carts = current_user.carts
        carts = user_carts.where(deleted_flag: "false")
        if carts != []
          @carts_count = carts.count
        end
      end
    end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :postal_code, :address, :phone_number, :deleted_flag, :profile_image, :first_name, :last_name, :kana_first_name, :kana_last_name])
  end

  private
    def storable_location?
      request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
    end
  def store_user_location!
  	store_location_for(:user, request.fullpath)
  end
end
