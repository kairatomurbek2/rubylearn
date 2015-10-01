puts "Enter first string:"
first_string_length = gets.chomp.length

puts "Enter second string:"
second_string_length = gets.chomp.length

if first_string_length > second_string_length
  puts "First string is longer than second by #{first_string_length} characters"
elsif first_string_length == second_string_length
  puts "Your strings are equal in length!"
else
  puts "Second string is longer than first by #{second_string_length} characters."
end