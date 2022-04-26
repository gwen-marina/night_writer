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
    braille_alpha = []
    message_reader.split("").each do |letter|
      braille_alpha << dictionary.create_alphabet[letter]
    end
    output_file.write(formater(braille_alpha))
  end

  def formater(braille_array)
   first = []
   second = []
   third = []
   braille_array.each do |array|
     first.push(array[0].to_s)
     second.push(array[1].to_s)
     third.push(array[2].to_s)
    end
   "#{first.join}\n#{second.join}\n#{third.join}\n"
  end

  def puts_message
    chars = message_reader.length
    puts "Created '#{output_file.path}' containing #{chars} characters"
  end
end
