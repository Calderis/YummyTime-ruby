require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Myapp
	class Application < Rails::Application
		config.assets.paths << Rails.root.join("app", "assets", "fonts")
		config.paths.add 'app/presenters', :eager_load => true
		config.web_console.whitelisted_ips = '172.19.0.1'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
end
end
