require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "neo4j/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

require File.expand_path('../../lib/wait_for_neo4j', __FILE__)

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Pokesite
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

    # Configure Neo4j connection after waiting for 30 seconds for connection to become available
    db_path = "http://#{ENV.fetch("DB_PORT_7474_TCP_ADDR", "localhost")}:#{ENV.fetch("DB_PORT_7474_TCP_PORT", 7474)}"
    WaitForNeo4j::wait_for db_path

    config.neo4j.session_type = :server_db
    config.neo4j.session_path = db_path

    config.autoload_paths << Rails.root.join('lib')

    # Allow web console access from boot2docker host
    config.web_console.whitelisted_ips = %w( 172.17.42.0/24 192.168.0.0/16 )
  end
end
