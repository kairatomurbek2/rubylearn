def guess_with_random(cpu_random_number)
  number_min = 1
  number_max = 100

  counter = 0
  loop do
    counter += 1

    help_number = rand(number_min...number_max)
    if cpu_random_number > help_number
      number_min = help_number
    elsif cpu_random_number < help_number
      number_max = help_number
    else
      cpu_random_number == help_number
      break
    end
  end

  return counter
end

def guess_with_binary(cpu_random_number)
  number_min = 1
  number_max = 100

  help_number = (number_max / 2.0).ceil
  result = ""

  counter = 0
  loop do
    counter += 1

    if cpu_random_number > help_number
      number_min = help_number
      help_number = ((number_max - number_min) / 2.0 + number_min).ceil
    elsif cpu_random_number < help_number
      number_max = help_number
      help_number = ((number_max + number_min) / 2.0).ceil
    else
      cpu_random_number == help_number
      break
    end
  end

  return counter
end

def average(array)
  sum = 0
  array.each do |item|
    sum += item
  end
  return sum/array.size.to_f
end

guess_with_random_array = []
guess_with_binary_array = []

number_of_values = 10

10.times do

  cpu_random_number = rand(1..100)

  random_method_counters = guess_with_random(cpu_random_number)
  guess_with_random_array.push(random_method_counters)

  binary_method_counters = guess_with_binary(cpu_random_number)
  guess_with_binary_array.push(binary_method_counters)

end

average_of_guess_with_random_array = average(guess_with_random_array)
average_of_guess_with_binary_array = average(guess_with_binary_array)

puts "The number of values is: #{number_of_values}"

puts "Average:
by random method: #{average_of_guess_with_random_array} 
by binary method: #{average_of_guess_with_binary_array}"