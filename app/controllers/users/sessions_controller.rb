class Users::SessionsController < Devise::SessionsController
  layout "single"
  
  def destroy
    if current_user.provider != ""
      session.delete("devise.#{current_user.provider}_data")
    end
    super
  end
end
