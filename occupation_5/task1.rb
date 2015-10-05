puts "Enter size of arrays: "
size_input = gets.chomp.to_i


meteo_station_south = []
meteo_station_north = []
meteo_station_east = []
meteo_station_west = []

until meteo_station_south.size == size_input
  number = rand 15..30
  meteo_station_south.push (number).to_i

  until meteo_station_north.size == size_input
    number = rand 15..30
    meteo_station_north.push (number).to_i

    until meteo_station_east.size == size_input
      number = rand 15..30
      meteo_station_east.push (number).to_i

      until meteo_station_west.size == size_input
        number = rand 15..30
        meteo_station_west.push (number).to_i
      end
    end
  end
end

puts "Generated arrays of temperatures:"
print "\n"

puts "meteo_station_south = #{meteo_station_south}"
puts "meteo_station_north = #{meteo_station_north}"
puts "meteo_station_east = #{meteo_station_east}"
puts "meteo_station_west = #{meteo_station_west}"

result_array = Array.new

result_array = (meteo_station_south + meteo_station_north + meteo_station_east + meteo_station_west)

result = result_array.inject(0){ |result, item| result + item }

mean = result / result_array.size.to_f
mean = sprintf("%.3f", mean)

puts "Average temperature is #{mean}"