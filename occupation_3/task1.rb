puts "Enter first number:"
first_number = gets.chomp.to_i

puts "Enter second number:"
second_number = gets.chomp.to_i

random = rand(first_number...second_number)
puts "Your random number is #{random}"