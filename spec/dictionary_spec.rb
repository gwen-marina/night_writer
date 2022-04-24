require 'simplecov'
SimpleCov.start
require './lib/dictionary'

RSpec.describe Dictionary do
  before :each do
    @dictionary = Dictionary.new
  end

  it "exists" do
    expect(@dictionary).to be_a(Dictionary)
  end

  it "can create an alphabet" do
    expect(@dictionary.create_alphabet).to be_a(Hash)
  end
end
