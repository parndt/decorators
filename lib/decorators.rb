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
      paths.registered.map { |path| find_decorators_in_path(path) }.flatten.uniq
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

    def apply_decorators_pattern_to_path(path)
      path.join *pattern
    end

    def find_decorators_in_path(path)
      Dir[apply_decorators_pattern_to_path(path)]
    end

    def pattern
      ['app', 'decorators', '*', '**', '*_decorator.rb']
    end
  end

end

require 'decorators/railtie'
