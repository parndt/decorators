require 'spec_helper'
require_relative 'support/decorate_me.rb'

describe Decorators do
  before do
    Decorators.register! File.expand_path('../support', __FILE__)
    Decorators.load! true
  end

  let(:decorated_class) { DecorateMe.new }
  it 'register decorators' do
    decorators = [
      decorator_path('decorate_me_decorator'),
      decorator_path('another_decorator')
    ]
    expect(Decorators.decorators).to eq(decorators)
  end

  it 'decorates class with same file name' do
    expect(decorated_class.kiwi).to eq("parndt")
  end

  it 'decorates class with different file name' do
    expect(decorated_class.am_i_decorated?).to eq(true)
  end
end

