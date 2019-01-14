class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_devise_layout, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :uid, :provider, :good_count, :normal_count, :bad_count])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:nickname, :uid, :provider, :good_count, :normal_count, :bad_count])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :uid, :provider, :good_count, :normal_count, :bad_count])
  end
  def set_devise_layout
    "layout_name_for_devise"
  end

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
