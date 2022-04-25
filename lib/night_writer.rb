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
      require'pry'; binding.pry
    end
    output_file.write(formater(braille_alpha))
  end

  def formater(braille_array)
   column1 = []
   column2 = []
   column3 = []
   braille_array.each do |array|
     column1.push(array[0].to_s)
     column2.push(array[1].to_s)
     column3.push(array[2].to_s)
    end
   "#{column1.join}\n#{column2.join}\n#{column3.join}\n"
  end

  def puts_message
    chars = message_reader.length
    puts "Created '#{output_file.path}' containing #{chars} characters"
  end
end
