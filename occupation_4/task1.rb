puts "Enter number of strings:"
number = gets.chomp.to_i
result = []


for i in 1..number
  puts "Enter string number #{i}:"
  result.push gets.chomp.capitalize
end

puts "Result:"
puts result.join ", "
puts "The program has finished"