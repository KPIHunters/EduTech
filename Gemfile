ruby '2.7.2'
#ruby=2.7.2@hotmarket
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Mimemagic version purged rebased
gem 'mimemagic', github: 'mimemagicrb/mimemagic', ref: '01f92d86d15d85cfd0f20dabd025dcbd36a8a60f'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
# Use mysql as the database for Active Record
# gem 'mysql2', '>= 0.4.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# SSL
gem 'openssl', '~> 2.2'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Mailer
# gem 'google-api-client', '~> 0.53.0'
# gem 'omniauth-google-oauth2', '~> 0.8.1'

# Faster & easier HTML
gem 'slim-rails', '~> 3.2'

# Load .env
gem 'dotenv', '~> 2.7', '>= 2.7.6'

# Debug
gem 'listen', '~> 3.2'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2'

# Color to the prints on console (PUTS)
gem 'colorize', '~> 0.8.1'

###########################
#  LOGIN MANAGEMENT       #
###########################
# Session manager
gem 'devise', '~> 4.8.0'
gem 'devise_invitable', '~> 2.0', '>= 2.0.5'
# Role Profile Devise user's roles manager
# gem 'the_role', '~> 3.9.0'
# Animated Progress link/screen transaction
gem 'nprogress-rails', '~> 0.2.0.2'
# OAuth
# gem 'koala', '~> 2.2.0'
gem 'omniauth', '~> 2.0', '>= 2.0.4'
gem 'omniauth-github', '~> 2.0'
gem 'omniauth-linkedin-oauth2', '~> 1.0'
gem 'omniauth-rails_csrf_protection', '~> 1.0'

# cron job manager
gem 'whenever'

# second factor authentication
# gem 'active_model_otp', '~> 2.1'
gem 'devise-two-factor', '~> 3.1'

###########################
#     LOGIC HELPERS       #
###########################
# IBGE County & State Codes & names
gem 'ibge', '~> 0.2.1'

# soft-delete
gem 'paranoia', '~> 2.2'

# CPF/CNPJ actions
gem 'cpf_cnpj', '~> 0.5.0'

# Create readable attrs values
gem 'faker', '~> 2.14'

###########################
#  INTERNATIONALIZATION   #
###########################
# World Countries Flags
gem 'world-flags', '~> 0.6.6'
# ISO Country Codes to use WorldFlags & Internationalize
gem 'countries', '~> 3.0', '>= 3.0.1'
# ISO Cities
# gem 'cities', '~> 0.3.1'
gem 'city-state', '~> 0.1.0'

###########################
#   ICON & UI PACKAGES    #
###########################
# IconFonts - Themify
# gem 'themify-icons-rails', github: 'scratch-soft/themify-icons-rails'
# IconFonts - FontAwesome
# gem 'font-awesome-rails', '4.7.0.5'
# Bootstrap
gem 'bootstrap', '~> 4.5', '>= 4.5.2'
# jQuery
gem 'jquery-rails', '~> 4.4'
# ionic IconFonts (https://ionicons.com/v2/)
# gem 'ionicons-rails', '~> 2.0'
# FontAwesome
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.6'
# Creative-Tim assets Private-GEM
source 'https://B14-9aQKAAQ2Vzjx4UhV@gem.fury.io/tongarcia/' do
  gem 'creative_tim', '~> 0.0.7'
end

###########################
#     INFRA STRUCTURE     #
###########################
# gem 'aws-sdk', '~> 2.3'
gem "aws-sdk-s3"

group :development, :test do
  # To run SSL bind
  # gem 'thin', '~> 1.7', '>= 1.7.2'
  # Option to not use Fixtures (FactoryGirl)
  gem 'factory_bot', '~> 6.1'
  # RSPec Plugin for testing Views
  gem 'capybara', '~> 3.33'
  # RSPec Plugin for code-coverage
  gem 'simplecov', '~> 0.19.0'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # Run against the latest stable release
  gem 'rspec-rails', '~> 4.0.1'

  # Rails Dev Helpers (production ready allowed only for admin user)
  gem 'rails_db'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Rails Dev Helpers
  gem 'rails-erd' # Gem for diagrams model
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Heroku pre compile (rails 5+ doesnt support it)
#gem 'rails_12factor', group: :production
