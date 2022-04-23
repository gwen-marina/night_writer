input_file = File.open(ARGV[0], "r") #("r") is an argument that allows the file to be read
message_reader = input_file.read.delete("\n") #this is telling Ruby to read the File
input_file.close #everytime you open a file, you have to close it
chars = message_reader.length

writer = File.open(ARGV[1], "w")
writer.write(message_reader)
writer.close

puts "Created '#{ARGV[1]}' containing #{chars} characters"
