module Decorators
  require 'decorators/paths'

  class << self
    def load!(cache_classes)
      decorators.each do |decorator|
        if cache_classes
          require decorator
        else
          load decorator
        end
      end
    end

    def decorators
      paths.registered.map { |path|
        Dir[path.join('app', 'decorators', '**', '*_decorator.rb')]
      }.flatten.uniq
    end

    def register!(*paths_to_register)
      paths_to_register.flatten.map do |path|
        paths.register! path
      end
    end

    protected
    def paths
      @paths ||= Paths.new
    end
  end

end

require 'decorators/railtie'
