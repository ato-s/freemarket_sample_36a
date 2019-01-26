class Users::RegistrationsController < Devise::RegistrationsController
  layout "single"

  def select_api
  end
  def complete
  end

  protected
  def after_inactive_sign_up_path_for(resource)
    new_user_session_path
  end
  def after_confirmation_path_for(resource_name, resource)
    new_user_session_path
  end
end
