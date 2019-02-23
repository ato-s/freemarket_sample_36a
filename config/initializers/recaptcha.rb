Recaptcha.configure do |config|
  config.site_key = Rails.application.secrets.recaptcha_sitekey
  config.secret_key = Rails.application.secrets.recaptcha_secretkey
end
