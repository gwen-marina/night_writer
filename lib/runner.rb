require './lib/night_writer'

night_writer = NightWriter.new(File.open(ARGV[0], "r"), File.open(ARGV[1], "r+"))
night_writer.puts_message
night_writer.output_file_writer
