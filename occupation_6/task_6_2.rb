fruit_file = File.open("raiting.txt")
movies = {}
fruit_file.each_line do |line|
  fruit, count = line.split
  movies[fruit] = count
end
fruit_file.close

def enter_sign()
  print "> "
  return gets.chomp
end

def films_comparison(movies_in_database, movie_title)
  movies_in_database.each do |key, value|
    if key == movie_title

      return key
    end
  end

  return nil
end

def films_comparison_value(movies_in_database, movie_title)
  movies_in_database.each do |key, value|
    if key == movie_title

      return value
    end
  end

  return nil
end

def mean_rate (ratings)
  result = 0
  ratings.each do |key, rating|

    result += rating
  end

  return result / ratings.length.to_f
end

loop do
  puts "What do you want to do: "
  print "\n"

  command = enter_sign

  case command
    when "list"
      movies.each do |movie, value|
        puts "Movie: #{movie} #{value}"
      end

    when "add"
      new_movie = {}

      puts "Enter the title of the movie: "
      entered_movie = enter_sign

      comparison = films_comparison(movies, entered_movie)

      if comparison.nil?
        new_movie = {entered_movie => {}}
        movies.update(new_movie)
        puts "Movie added successfully"

      else
        puts "This movie is already exist"
      end

    when "add rating"
      movies = {}
      new_rating = {}

      puts "Please enter the movie title"
      entered_title = enter_sign

      comparison = films_comparison_value(movies, entered_title)

      if comparison.nil?
        puts "This movie doesn't exist"
      else
        puts "Enter your name"
        name = enter_sign
        puts "Enter your rating for #{entered_title}"
        rating = enter_sign.to_i

        if (rating > 10) or (rating < 0)
          puts "ERROR. Please enter new rating from 0 to 10"
        else
          new_rating = {name => rating}
          comparison.update(new_rating)
          puts "A rating has been added for #{entered_title}: #{name} rated it #{rating}"
        end
      end

    when "see rating"
      puts "Please enter the movie title"
      entered_title = enter_sign

      comparison = films_comparison_value(movies, entered_title)

      if comparison.nil?
        puts "This movie doesn't exist"
      else
        puts "#{entered_title} ratings: "
        comparison.each do |key, value|
          puts "#{key} rated it #{value}"
        end
      end

      average = mean_rate(comparison)
      puts "Average rating for the movie: #{average}"

    when "all ratings"

      movies.each do |movie, raters|
        average = mean_rate(raters)
        puts "#{movie} is rated #{average}"
      end

    when "exit"
      puts "Exiting..."
      break
    else
      puts "No such command. Try again"
  end

end