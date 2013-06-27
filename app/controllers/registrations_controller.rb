class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, only: [:update, :create]

  protected

  def permitted_params
    [:username, :email, :currency, :password, :current_password]
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(permitted_params) }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(permitted_params) }
  end
end
