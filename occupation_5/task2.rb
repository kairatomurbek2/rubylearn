puts "Enter first sentence:"
first_sentence = gets.chomp

puts "Enter second sentence:"
second_sentence = gets.chomp

first_sentence = [first_sentence].join(", ").split(" ")
second_sentence = [second_sentence].join(", ").split(" ")

print (first_sentence & second_sentence).join(", ")