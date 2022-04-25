require 'simplecov'
SimpleCov.start
require './lib/night_writer'
require './lib/dictionary'

RSpec.describe NightWriter do
  before :each do
    @night_writer = NightWriter.new(File.open("test_message.txt", "r"), File.open("test_output.txt", "r+"))
  end

  it "exists" do
    expect(@night_writer).to be_a NightWriter
  end

  it "can write to an output file" do
    @night_writer2 = NightWriter.new(File.open("test_message.txt", "r"), File.open("test_output.txt", "r+"))
    @night_writer2.output_file_writer
    @nw = NightWriter.new(File.open("test_message.txt", "r"), File.open("test_output.txt", "r+"))
    expect(@nw.output_file.read).to eq ("0.\n..\n..\n")
  end

end
