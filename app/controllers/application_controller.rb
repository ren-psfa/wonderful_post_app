class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :null_session

  # def after_sign_in_path_for(resource)
  #   articles_path
  # end

  # def after_sign_out_path_for(resource)
  #   new_user_session_path
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:nickname])
  end
end
