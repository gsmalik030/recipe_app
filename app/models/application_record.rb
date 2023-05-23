class ApplicationRecord < ActiveRecord::Base 
  # before_action :authenticate_user!
  # before_action :configure_permitted_parameters, if: :devise_controller?
  primary_abstract_class
  # protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password password_confirmation])
  #   devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
  # end
end
