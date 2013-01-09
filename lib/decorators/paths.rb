require 'pathname'

module Decorators
  class Paths

    attr_reader :registered
    def initialize(*args)
      @registered = Array.new(*args)
    end

    def register!(path)
      @registered << Pathname.new(path)
    end

  end
end
