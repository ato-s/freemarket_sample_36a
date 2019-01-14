class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_devise_layout, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :uid, :provider, :good_count, :normal_count, :bad_count, avatars_attributes: [:user_id, :content], mypage_attributes: [:user_id, :profile]])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:nickname, :uid, :provider, :good_count, :normal_count, :bad_count])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :uid, :provider, :good_count, :normal_count, :bad_count])
  end

  def set_devise_layout
    "layout_name_for_devise"
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def after_sign_in_path_for(resource)
    if current_user.addresses.present?
      root_path
    else
      new_address_path
    end
  end
end
