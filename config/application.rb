require File.expand_path('../boot', __FILE__)
require 'pp'
require 'rails/all'
require 'rqrcode'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EventManagement
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

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    # Add frontend assets path`
    # config.assets.paths << Rails.root.join('app', 'assets', 'frontend', 'css')
    # config.assets.paths << Rails.root.join('app', 'assets', 'frontend', 'img')
    # config.assets.paths << Rails.root.join('app', 'assets', 'frontend', 'js')
    # config.assets.paths << Rails.root.join('app', 'assets', 'frontend', 'fonts')

    # Add bootstrap path
    # config.assets.paths << Rails.root.join('app', 'assets', 'backend', 'bootstrap', 'css')
    # config.assets.paths << Rails.root.join('app', 'assets', 'backend', 'bootstrap', 'fonts')
    # config.assets.paths << Rails.root.join('app', 'assets', 'backend', 'bootstrap', 'js')

    # Add adminre template path
    # config.assets.paths << Rails.root.join('app', 'assets', 'css')
    # config.assets.paths << Rails.root.join('app', 'assets', 'img')
    # config.assets.paths << Rails.root.join('app', 'assets', 'js')
    # config.assets.paths << Rails.root.join('app', 'assets', 'assets')
    # config.assets.paths << Rails.root.join('app', 'assets', 'bootstrap')
    # # config.assets.paths << Rails.root.join('app', 'assets', 'bootstrap')
    # config.assets.paths << Rails.root.join('app', 'assets', 'plugins')
    # config.assets.paths << Rails.root.join('app', 'assets', 'img', 'icons')

config.autoload_paths += %W(#{config.root}/app/models/ckeditor)
    # config.autoload_paths += %W(#{config.root}/app/uploaders)

  end
end
