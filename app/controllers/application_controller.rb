class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_categories

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :profile, :uid, :provider, :good_count, :normal_count, :bad_count, :money, :point, avatars_attributes: [:user_id, :content]])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:nickname, :profile, :uid, :provider, :good_count, :normal_count, :bad_count, :money, :point])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :profile, :uid, :provider, :good_count, :normal_count, :bad_count, :money, :point])
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
  def set_item
    @item = Item.find(params[:item_id])
  end

  def confirm_transaction_stage_under_transaction
    redirect_to mypages_path unless @item.transaction_stage == 'under_transaction'
  end
  def confirm_buyer_or_seller_include_current_user
    redirect_to mypages_path unless [@item.buyer_id, @item.seller_id].include?(current_user.id)
  end

  def information_is_exist?
    @item.information.where(information_type: @information_type).present?
  end
  def create_information
    if @information_type == 'be_discounted'
      @information = Information.create(information_type: @information_type, stakeholder_id: current_user.id, related_item_id: @item.id, originally_price: @originally_price, changed_price: @changed_price)
      @liker_ids.each do |liker_id|
        UserInformation.create(information_id: @information.id, user_id: liker_id)
      end
    else
      @information = Information.create(information_type: @information_type, stakeholder_id: current_user.id, related_item_id: @item.id)
      if @information_type == 'be_purchased'
        UserInformation.create(information_id: @information.id, user_id: @item.seller_id)
      elsif @information_type == 'be_shiped'
        UserInformation.create(information_id: @information.id, user_id: @item.buyer_id)
      elsif @information_type == 'be_evaluated'
        UserInformation.create(information_id: @information.id, user_id: @review.appraisee_id)
      elsif @information_type == 'be_liked'
        UserInformation.create(information_id: @information.id, user_id: @item.seller_id)
      elsif @information_type == 'transaction_has_been_finished'
        UserInformation.create(information_id: @information.id, user_id: @item.buyer_id)
      end
    end
  end
  def set_todo_and_information
    @todos = current_user.todos.includes([item: :pictures])
    @information = current_user.information.includes([related_item: :pictures])
  end
end
