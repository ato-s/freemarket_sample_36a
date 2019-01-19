Devise.setup do |config|

  config.omniauth :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], scope: 'email', info_fields: 'email', callback_url: "#{ENV['API_HOST']}/users/auth/facebook/callback"
  config.omniauth :twitter, ENV['TWITTER_API_KEY'], ENV['TWITTER_API_SECRET'], scope: 'email', oauth_callback: "#{ENV['API_HOST']}/users/auth/twitter/callback"
  config.omniauth :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], scope: 'email', redirect_uri: "#{ENV['API_HOST']}/users/auth/google_oauth2/callback"
  config.omniauth :instagram, ENV['INSTAGRAM_CLIENT_ID'], ENV['INSTAGRAM_CLIENT_SECRET'], redirect_uri: "#{ENV['API_HOST']}/users/auth/instagram/callback"
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
