module Decorators
  require "decorators/paths"

  class << self
    def load!(cache_classes)
      decorators_with_argument_errors = []
      decorators.each do |decorator|
        load_decorator(decorator, cache_classes)
      rescue ArgumentError
        decorators_with_argument_errors << decorator
      end

      decorators_with_argument_errors.each do |decorator|
        load_decorator(decorator, cache_classes)
      end
    end

    def decorators
      paths.registered.map(&method(:find_decorators_in_path)).flatten.uniq
    end

    def register!(*paths_to_register)
      paths_to_register.flatten.map do |path|
        paths.register! path
      end
    end

    private

    def paths
      @paths ||= Paths.new
    end

    def apply_decorators_pattern_to_path(path)
      path.join(*pattern)
    end

    def find_decorators_in_path(path)
      Dir[apply_decorators_pattern_to_path(path)]
    end

    def load_decorator(decorator, cache_classes)
      if cache_classes
        require decorator
      else
        load decorator
      end
    end

    def pattern
      ["app", "decorators", "*", "**", "*_decorator.rb"]
    end
  end
end

require "decorators/railtie"
