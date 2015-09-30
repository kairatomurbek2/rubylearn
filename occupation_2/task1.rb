puts "your name?"
first_name = gets.chomp.capitalize
puts "your last name?"
last_name = gets.chomp.capitalize
puts "When were you born?"
born = 2015 - gets.chomp.to_i
puts "Where are you from?"
from = gets.chomp.capitalize
puts "Hello, #{first_name} #{last_name}. You are #{born} years old. You are living in #{from}"