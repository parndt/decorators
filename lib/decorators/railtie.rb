# frozen_string_literal: true

require "rails"

module Decorators
  class Railtie < Rails::Railtie
    config.before_initialize do |app|
      # Tell Zeitwerk to ignore app/decorators in the main app
      app_decorators = Rails.root.join("app", "decorators")
      Rails.autoloaders.main.ignore(app_decorators) if app_decorators.exist?

      loader = proc { Decorators.load!(app.config.cache_classes) }

      if app.config.eager_load
        app.config.after_initialize(&loader)
      else
        app.config.to_prepare(&loader)
      end
    end
  end
end
