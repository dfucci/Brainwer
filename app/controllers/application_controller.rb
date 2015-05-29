class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception
  before_filter :configure_devise_parameters, if: :devise_controller?

  protected
  def configure_devise_parameters
    devise_parameter_sanitizer.for(:sign_up) << :surname
    devise_parameter_sanitizer.for(:account_update) << :surname
  end
end
