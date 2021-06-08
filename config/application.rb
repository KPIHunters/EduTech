require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

require "dotenv"

if Rails.env.development? || Rails.env.test?
  NENV = Dotenv.load(".env")
elsif Rails.env.production?
  NENV = ENV
end

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HotMarket
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Don't generate system test files.
    config.generators.system_tests = nil

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Brasilia'

    # Set config HTTP errors on Routes
    config.exceptions_app = self.routes
    Rails.application.config.action_controller.include_all_helpers = true

    # Load Lib files
    config.autoload_paths += %W(#{config.root}/lib)

    # Store files on Amazon S3.
    config.active_storage.service = :amazon

    # Ignore bad email addresses and do not raise email delivery errors.
    # Set this to true and configure the email server for immediate delivery to raise delivery errors.
    config.action_mailer.default_url_options = {host: NENV['MAILER_HOST'] } #TODO
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.perform_deliveries = true
    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.default charset: 'utf-8'
    config.action_mailer.raise_delivery_errors = true # to raise error if smtp has error on setup
    config.action_mailer.smtp_settings = {
      port:                 NENV['SMTP_PORT'],
      domain:               NENV['SMTP_DOMAIN'],
      address:              NENV['SMTP_ADDRESS'],
      authentication:       NENV['SMTP_AUTHENTICATION'],
      enable_starttls_auto: true,
      user_name:            NENV['SMTP_USER_NAME'],
      password:             NENV['SMTP_PASSWORD']
    }

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :'pt-br'

    # Generators using JS not Coffee
    config.generators.javascript_engine :js
  end
end
