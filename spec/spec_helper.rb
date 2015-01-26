RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.order = 'random'
end

def decorator_path(name)
  File.expand_path("../support/app/decorators/classes/#{name}.rb", __FILE__)
end

# poor's man require relative
unless Kernel.respond_to?(:require_relative)
  module Kernel
    def require_relative(path)
      require File.join(File.dirname(caller[0]), path.to_str)
    end
  end
end

require_relative '../lib/decorators'

