# frozen_string_literal: true

require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# Dotenv::Railtie.load

module TestGuru2
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1
    config.autoload_lib(ignore: %w(assets tasks))
    config.i18n.default_locale = :ru
    I18n.available_locales = [:en, :ru]
    config.autoload_paths << "#{Rails.root}/lib/clients"
  end
end
