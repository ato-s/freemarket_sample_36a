Devise.setup do |config|

  config.omniauth :facebook, Rails.application.secrets.facebook_key, Rails.application.secrets.facebook_secret, scope: 'email', info_fields: 'email', callback_url: "#{Rails.application.secrets.api_host}/users/auth/facebook/callback"
  config.omniauth :twitter, Rails.application.secrets.twitter_api_key, Rails.application.secrets.twitter_api_secret, scope: 'email', oauth_callback: "#{Rails.application.secrets.api_host}/users/auth/twitter/callback"
  config.omniauth :google_oauth2, Rails.application.secrets.google_client_id, Rails.application.secrets.google_client_secret, scope: 'email', redirect_uri: "#{Rails.application.secrets.api_host}/users/auth/google_oauth2/callback"
  config.omniauth :instagram, Rails.application.secrets.instagram_client_id, Rails.application.secrets.instagram_client_secret, redirect_uri: "#{Rails.application.secrets.api_host}/users/auth/instagram/callback"
  OmniAuth.config.logger = Rails.logger if Rails.env.development?

  config.secret_key = Rails.application.secrets.devise_secret_key

  config.mailer_sender = 'freemarket.sample.36a@gmail.com'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]

  config.strip_whitespace_keys = [:email]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 11

  config.reconfirmable = true

  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 6..128

  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  config.timeout_in = 30.minutes

  config.unlock_strategy = :email
  config.maximum_attempts = 3

  config.reset_password_within = 6.hours

  config.sign_out_via = :delete

end
