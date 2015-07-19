require File.expand_path('../boot', __FILE__)

<<<<<<< HEAD
require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
# require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
=======
#require 'rails/all'
require "action_controller/railtie"
require "action_mailer/railtie"
#require "active_resource/railtie"
>>>>>>> aaf230b137def9c1fe6b29a1d0c110e30e996aa4
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

<<<<<<< HEAD
module Pmn2015
=======
module PremonitionsSite
>>>>>>> aaf230b137def9c1fe6b29a1d0c110e30e996aa4
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
<<<<<<< HEAD
=======

>>>>>>> aaf230b137def9c1fe6b29a1d0c110e30e996aa4
    config.encoding = "utf-8"

    # Enable the asset pipeline
    config.assets.enabled = true

    
    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'
    # Prevent initializing the application before assets are precompiled (required for heroku)
    config.assets.initialize_on_precompile = false
  end
end
