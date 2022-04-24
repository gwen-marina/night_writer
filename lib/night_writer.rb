require './lib/dictionary'

input_file = File.open(ARGV[0], "r") #("r") is an argument that allows the file to be read
message_reader = input_file.read.delete("\n") #this is telling Ruby to read the File
input_file.close #everytime you open a file, you have to close it
chars = message_reader.length

writer = File.open(ARGV[1], "w")
dictionary = Dictionary.new
dictionary_hash = dictionary.create_alphabet[message_reader]
dictionary_hash.each do |symbol|
  writer.write("#{symbol}\n")
  # require 'pry'; binding.pry
end
writer.close

# Update your program again so that it can take multiple letters. Compare results with a classmate.
# Update the program so that messages of more than 80 characters are split over multiple lines.

puts "Created '#{ARGV[1]}' containing #{chars} characters"
