class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_categories

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :profile, :uid, :provider, :good_count, :normal_count, :bad_count, avatars_attributes: [:user_id, :content]])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:nickname, :profile, :uid, :provider, :good_count, :normal_count, :bad_count])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :profile, :uid, :provider, :good_count, :normal_count, :bad_count])
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
  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  private

  def set_categories
    @upper_categories = UpperCategory.eager_load(middle_categories: [:lower_categories])
  end

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == 'password'
      # username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def set_locale
    I18n.locale = :ja
  end

  def confirm_transaction_stage_under_transaction
    redirect_to mypages_path unless @item.transaction_stage == 'under_transaction'
  end
  def confirm_buyer_or_seller_include_current_user
    redirect_to mypages_path unless [@item.buyer_id, @item.seller_id].include?(current_user.id)
  end
end
