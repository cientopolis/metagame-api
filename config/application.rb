require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MetagameApi
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
    config.autoload_paths << Rails.root.join("app/query")
    config.autoload_paths << Rails.root.join("app/activities")
    config.autoload_paths << Rails.root.join("app/profiles")
    config.autoload_paths << Rails.root.join("app/observers")
    config.autoload_paths << Rails.root.join("app/models/ranks")
    config.autoload_paths << Rails.root.join("app/models/records")

    #config.autoload_paths << Rails.root.join("app/metagame")
#    config.active_record.observers = :badge_judge

    # Do not swallow errors in after_commit/after_rollback callbacks.
    #We populate database
    #.application.load_seed

    #config.active_record.raise_in_transactional_callbacks = true
    config.action_dispatch.default_headers = {
        'Access-Control-Allow-Origin' => '*',
        'Access-Control-Request-Method' => %w{GET POST OPTIONS}.join(",")
      }

    #Rspec configs
    config.generators do |g|
      g.test_framework :rspec,
        :fixtures => true,        # generate a fixture for each model
        :view_specs => false,     # Skip generating view specs.
        :helper_specs => false,   # Skips generating specs for the helper files Rails generates with each controller
        :routing_specs => false,  # Omits a spec file for your config/routes.rb
        :controller_specs => true,
        :request_specs => true
      g.fixture_replacement :factory_girl, :dir => "spec/factories" # Generate factories instead of fixtures
    end
  end
end
