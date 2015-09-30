a = rand 1..9
b = rand 1..9
result = a * b

puts "How many is #{a} * #{b}? "
answer = gets.chomp.to_i

if answer == result
  puts "You are correct."
else
  puts "You are wrong. Correct answer: #{a} * #{b} =  #{result}"
end