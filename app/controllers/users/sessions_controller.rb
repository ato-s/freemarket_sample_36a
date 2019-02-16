class Users::SessionsController < Devise::SessionsController
  prepend_before_action :check_captcha, only: [:create]
  layout "single"

  def destroy
    if current_user.provider != ""
      session.delete("devise.#{current_user.provider}_data")
    end
    super
  end

  protected
  def check_captcha
    unless verify_recaptcha
      self.resource = resource_class.new sign_in_params
      resource.validate
      set_minimum_password_length
      respond_with resource
    end
  end
end
