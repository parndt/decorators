require 'rails'

module Decorators
  class Railtie < Rails::Railtie

    config.to_prepare do
      Decorators.load! Rails.application.config.cache_classes
    end

    config.after_initialize do
      Decorators.load! Rails.application.config.cache_classes
    end

    config.after_initialize do
      Decorators.load! Rails.application.config.cache_classes
    end

  end
end
