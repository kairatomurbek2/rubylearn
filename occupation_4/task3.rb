def put(symbol, count = 1)
  count.times do
    print symbol
  end
end

puts "Enter height of the pyramid:"
size = gets.chomp.to_i

star_count = 1
spaces_count = size - star_count
space_symbol = ' '
star_symbol = '*'

size.times do
  put space_symbol, spaces_count
  put star_symbol, star_count
  puts

  spaces_count -= 1
  star_count += 2
end