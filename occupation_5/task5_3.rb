items = ["Chocolate", "Cheese", "Milk", "Bread"]
prices = [3, 15, 4.5, 2.15]

title = sprintf("%-20s %6s", "Name", "Price")
puts "#{title}"

for number in 0...items.length
  print sprintf("%-20s %6.2f", items[number], prices[number].to_f) + "\n"
end
