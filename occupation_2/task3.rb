grades = {}

puts "Enter grade for Jake:"
grades[:Jake] = gets.chomp.to_i

puts "Enter grade for John:"
grades[:John] = gets.chomp.to_i

puts "Enter grade for Jack:"
grades[:Jack] = gets.chomp.to_i

puts "Enter grade for Jane:"
grades[:Jane] = gets.chomp.to_i

grades1 = grades[:Jake] + grades[:John] + grades[:Jack] + grades[:Jane] / 4
puts "Mean for grades: #{grades1}"