class ApplicationController < ActionController::Base

	  before_action :configure_permitted_parameters,  if: :devise_controller?

	  def after_sign_in_path_for(resource)
	  	cds_path
	  end

	  def after_sign_out_path_for(resource)
	  	root_path
	  end




  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :postal_code, :address, :phone_number, :deleted_flag, :profile_image, :first_name, :last_name, :kana_first_name, :kana_last_name])
  end
end
