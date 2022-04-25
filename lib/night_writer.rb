require './lib/dictionary'

class NightWriter
  attr_accessor :input_file,
                :output_file,
                :message_reader

  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
    @message_reader = input_file.read.delete("\n")
  end

  def output_file_writer
    dictionary = Dictionary.new
    dictionary_hash = dictionary.create_alphabet[message_reader]
    dictionary_hash.each do |symbol|
      output_file.write("#{symbol}\n")
    end
  end

  def puts_message
    chars = message_reader.length
    puts "Created '#{output_file.path}' containing #{chars} characters"
  end
end
