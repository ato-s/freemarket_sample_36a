class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    callback_for(:facebook)
  end

  def twitter
    callback_for(:twitter)
  end

  def google_oauth2
    callback_for(:google)
  end

  def instagram
    callback_for(:instagram)
  end

  private

  def callback_for(provider)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    @user.skip_confirmation!
    Avatar.create(user_id: @user.id) if @user.avatars.length == 0
    Mypage.create(user_id: @user.id) if @user.mypage == nil
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to new_user_registration_path
    end
  end
end
