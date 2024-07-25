require "pathname"

module Decorators
  class Paths
    attr_reader :registered
    def initialize(*)
      @registered = Array.new(*)
    end

    def register!(path)
      @registered << Pathname.new(path)
    end
  end
end
