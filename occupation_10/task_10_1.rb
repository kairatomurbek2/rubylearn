file_to_read = ARGV[0]

number_of_characters = 0
number_of_lines = 0
number_of_spaces = 0

file_contents = File.read(file_to_read)
number_of_characters = file_contents.length

file_contents.each_line do |line|
  number_of_lines += 1
end

file_contents.each_char do |character|
  if character == " "
    number_of_spaces += 1
  end
end

puts "Your file has #{number_of_characters} characters, #{number_of_lines} lines and #{number_of_spaces} spaces."