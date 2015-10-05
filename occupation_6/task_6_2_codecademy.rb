movies = {The_Matrix: 3,
          Silver_Strand: 4,
          Rotten: 2
}

puts "What do you want to do (add, update, display, delete)?"

choice = gets.chomp

case choice
  when 'add'
    puts "What movie do you want to add?"
    title = gets.chomp
    if movies[title.to_sym].nil?
      puts "Whats the rating (1-5)?"
      rating = gets.chomp

      movies[title.to_sym] = rating.to_i
      puts "#{title} has been added with a rating of #{rating}!"
    else
      puts "That movie already exists!. Its rating is #{movies[title.to_sym]}"
    end

  when 'update'
    puts "Whats the movie you want to update?"

    title = gets.chomp
    if movies[title.to_sym].nil?
      puts "#{title} not found!"
    else
      puts "Whats the new rating (1-5)?"
      rating = gets.chomp
      movies[title.to_sym] = rating.to_i
      puts "#{title} has been updated with the a new rating of #{rating}!"
    end

  when 'display'
    movies.each do |movie, rating|
      puts "#{movie}: #{rating}"
    end

  when 'delete'
    puts "Enter the title to delete!"
    title = gets.chomp
    if movies[title.to_sym].nil?
      puts "Movie #{title} not in database!"
    else movies.delete(title)
    puts "Movie #{title} has been deleted!"
    end
end