# Boots a minimal Rails app with an engine, both carrying decorators, and
# prints which decorations were applied. Run in a subprocess so each boot
# gets a fresh Rails.
require "logger"
require "rails"
require "decorators"

module Fixture
  class Engine < Rails::Engine
    config.root = File.expand_path("engine", __dir__)
  end

  class Application < Rails::Application
    config.root = File.expand_path("app", __dir__)
    config.eager_load = ENV["EAGER_LOAD"] == "true"
    config.logger = Logger.new(nil)
    config.secret_key_base = "secret"
    config.to_prepare { Decorators.register! Rails.root, Fixture::Engine.root }
  end
end

Fixture::Application.initialize!

widget = Widget.new
print [widget.respond_to?(:decorated_by_engine?), widget.respond_to?(:decorated_by_app?), defined?(WidgetPresenter).inspect].join(",")
