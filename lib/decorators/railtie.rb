require 'rails'

module Decorators
  class Railtie < Rails::Railtie

    load_decorators = proc do
      Decorators.load! Rails.application.config.cache_classes
    end

    config.to_prepare       &load_decorators
    config.after_initialize &load_decorators

  end
end
