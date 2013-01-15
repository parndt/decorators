require_relative '../lib/decorators'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.order = 'random'
  config.color_enabled = true
end

def decorator_path(name)
  File.expand_path("../support/app/decorators/classes/#{name}.rb", __FILE__)
end
