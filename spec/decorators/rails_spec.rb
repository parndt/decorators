require "open3"
require "rbconfig"

RSpec.describe "Booting a Rails app" do
  def boot(eager_load:)
    script = File.expand_path("../support/rails/boot.rb", __dir__)
    lib = File.expand_path("../../lib", __dir__)
    Open3.capture3({"EAGER_LOAD" => eager_load.to_s}, RbConfig.ruby, "-I", lib, script)
  end

  [true, false].each do |eager_load|
    context "with eager_load #{eager_load}" do
      it "applies decorators from the app and its engines" do
        output, errors, status = boot(eager_load: eager_load)

        expect(status).to be_success, errors
        expect(output).to eq("true,true,\"constant\"")
      end
    end
  end
end
