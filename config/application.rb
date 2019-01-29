require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FreemarketSample36a
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.to_prepare do
      Devise::SessionsController.layout "single"
      Devise::RegistrationsController.layout proc{ |controller| user_signed_in? ? "application" : "single" }
      Devise::ConfirmationsController.layout "single"
      Devise::UnlocksController.layout "single"
      Devise::PasswordsController.layout "single"
    end
    config.generators do |g|
      g.stylesheets false
      g.javascripts false
      g.helper false
      g.test_framework false
    end
    config.action_view.embed_authenticity_token_in_remote_forms = false

    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
<<<<<<< HEAD
    config.i18n.default_locale = :en
    config.i18n.available_locales = [:ja, :en]
    config.i18n.enforce_available_locales = true
=======
    config.i18n.default_locale = :ja
>>>>>>> parent of eed0d2f... Revert "Merge branch 'develop-mypage_creation' of https://github.com/ato-s/freemarket_sample_36a into develop-mypage_creation"
  end
end
