require 'spec_helper'

describe Decorators::Paths do
  context "initialized without arguments" do
    let(:paths) {Decorators::Paths.new}

    it 'initialize empty array' do
      expect(paths.registered).to eq([])
    end

    it 'adds path to registered paths' do
      paths.register! "mypath"
      expect(paths.registered).to eq([Pathname.new("mypath")])
    end
  end

  context "initialized with arguments" do
    let(:paths) {Decorators::Paths.new([Pathname("initpath")])}

    it 'initialize array with argument path' do
      expect(paths.registered).to eq([Pathname.new("initpath")])
    end

    it 'adds path to registered paths' do
      paths.register! "mypath"
      expect(paths.registered.count).to eq(2)
      expect(paths.registered.last).to eq(Pathname.new("mypath"))
    end
  end
end
