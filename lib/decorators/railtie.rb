require 'rails'

module Decorators
  class Railtie < Rails::Railtie

    config.before_initialize do |app|
      loader = proc { Decorators.load!(app.config.cache_classes) }

      if app.config.eager_load
        app.config.after_initialize(&loader)
      else
        app.config.to_prepare(&loader)
      end
    end

  end
end
