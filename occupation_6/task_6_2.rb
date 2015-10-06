def read_ratings()
  movies = {}

  file = File.open("ratings.txt")
  file.each_line do |line|
    value_of_movies_array = {}
    movies_array = []

    line_data = line.split(":")
    value_data = line_data[1].split(',')
    value_data.each do |item|
      movies_array = item.split("-")
      value_of_movies_array.update(movies_array[0] => movies_array[1]) if movies_array[1] != nil
    end
    movies.update(line_data[0] => value_of_movies_array)
  end

  file.close
  movies
end

def check_for_signs(entered_name)
  return true if (entered_name.count ",-:") > 0
end

def add_new_movie_to_the_end(introductions)
  new_movie_file = File.new("ratings.txt", "a")
  introductions.each do |movie_title, ratings|
    new_movie_file.write("#{movie_title}:")
    ratings.each do |key_of_ratings, value_of_ratings|
      new_movie_file.write ("#{key_of_ratings}-#{value_of_ratings},")
    end
    new_movie_file.write("\n")
  end

  new_movie_file.close
end

def rewrite_ratings_file(introductions)
  rewriting_file = File.new("ratings.txt", "w")
  introductions.each do |movie_title, ratings|
    rewriting_file.write("#{movie_title}:")
    ratings.each do |key_of_ratings, value_of_ratings|
      rewriting_file.write("#{key_of_ratings}-#{value_of_ratings},")
    end
    rewriting_file.write("\n")
  end

  rewriting_file.close
end

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
  if ratings.empty?
    return 0
  end
  result = 0
  ratings.each do |key, rating|
    result += rating.to_i
  end

  return result / ratings.length.to_f
end

movies = read_ratings()

loop do
  puts "What do you want to do:"
  print "\n"
  command = enter_sign()
  case command

    when "list"
      movies.each do |movie, value|
        puts "#{movie}:"
        if value.empty?
          puts "There is no rating for the #{movie} yet."
        else
          value.each do |ratings_key, ratings_value|
            print " => "
            print sprintf("%-11s %1s", ratings_key, ratings_value) + "\n"
          end
        end
        puts "__________________________________________"
      end

    when "add"
      puts "If you want to rewrite all movies ratings in catalog, press 1"
      puts "if you want to add new movie to the end of catalog, press 2"
      puts "______________________________________________________________"
      entered_number = enter_sign()

      case entered_number

        when "1"
          puts "Enter the title of the movie: "
          entered_movie = enter_sign.capitalize
          if check_for_signs(entered_movie)
            puts "ERROR. You can not use : - or , symbols"
          else
            comparison = films_comparison(movies, entered_movie)
            movies = {}
            if comparison.nil?
              new_movie = {entered_movie => {}}
              movies.update(new_movie)
              puts "All movies ratings rewritten successfully"
              rewrite_ratings_file(movies)
            else
              puts "This movie is already exist"
            end
          end

        when "2"
          puts "Enter the title of the movie: "
          entered_movie = enter_sign.capitalize
          if check_for_signs(entered_movie)
            puts "ERROR. You can not use : - or , symbols"
          else
            comparison = films_comparison(movies, entered_movie)
            movies = {}
            if comparison.nil?
              new_movie = {entered_movie => {}}
              movies.update(new_movie)
              puts "Movie added successfully"
              add_new_movie_to_the_end(movies)
            else
              puts "This movie is already exist"
            end
          end
          movies = read_ratings()
      end

    when "add rating"
      new_rating = {}
      puts "Please enter the movie title"
      entered_title = enter_sign.capitalize
      if check_for_signs(entered_title)
        puts "ERROR. You can not use : - or , symbols"
      else
        comparison = films_comparison_value(movies, entered_title)
        if comparison.nil?
          puts "This movie doesn't exist"
        else
          puts "Enter your name"
          name = enter_sign.capitalize
          if check_for_signs(name)
            puts "ERROR. You can not use : - or , symbols"
          else
            puts "Enter your rating from 0 to 10 for #{entered_title}"
            rating = enter_sign.to_i
            if (rating > 10) or (rating < 0)
              puts "ERROR. Please enter new rating from 0 to 10"
            else
              new_rating = {name => rating}
              comparison.update(new_rating)
              puts "A rating has been added for #{entered_title}: #{name} rated it #{rating}"
              rewrite_ratings_file(movies)
            end
          end
        end
      end

    when "see rating"
      puts "Please enter the movie title"
      entered_title = enter_sign.capitalize
      key = films_comparison(movies, entered_title)
      if key == entered_title
        comparison = films_comparison_value(movies, entered_title)
        if (comparison.nil?) or (comparison.empty?)
          puts "There is no rating for the #{entered_title} yet."
          next
        else
          puts "____________________________________"
          puts "#{entered_title} ratings: "
          comparison.each do |key, value|
            puts "#{key} rated it #{value}"
          end
        end
      else
        puts "This movie doesn't exist"
        next
      end
      average = mean_rate(comparison)
      puts "\n"
      puts "Average rating for the movie: #{average}"
      puts "_____________________________________"

    when "all ratings"
      puts "_____________________________________"
      movies.each do |movie, raters|
        average = mean_rate(raters)
        if average == 0
          puts "#{movie} is not rated yet."
        else
          puts "#{movie} is rated #{average}"
        end
      end
      puts "_____________________________________"

    when "delete"
      puts "Please enter the movie you want to delete"
      entered_movie = enter_sign.capitalize
      if check_for_signs(entered_movie)
        puts "ERROR. You can not use : - or , symbols"
      else
        comparison = films_comparison_value(movies, entered_movie)
        if comparison.nil?
          puts "This movie doesn't exist"
        else
          movies.delete entered_movie
          puts "You have successfully delete #{entered_movie} movie from the base"
          rewrite_ratings_file(movies)
        end
      end

    when "sort"
      sort_hash = {}
      movies.each do |movie_name, rating|
        average = mean_rate(rating)
        sort_hash.update(movie_name => average)
      end

      sort_results = sort_hash.sort_by {|key, value| value * -1}
      print sprintf("%-17s %6s", "Film", "Average rating") + "\n"
      puts "_____________________________________"
      sort_results.each do |title, rating|
        print sprintf("%-20s %6.1f", title, rating.to_f) + "\n"
      end
      puts "_____________________________________"

    when "sort ratings"
      puts "Enter the movie title, which sorted ratings you want to see"
      entered_title = enter_sign.capitalize
      movie_check = films_comparison_value(movies, entered_title)
      sort_ratings_results = movie_check.sort_by {|key, value| value.to_i}
      print sprintf("%-10s %6s", "Movie", "Ratings") + "\n"
      puts "_____________________________________"
      sort_ratings_results.each do |name, rating|
        print sprintf("%-8s %6.1i", name, rating.to_i) + "\n"
      end
      puts "_____________________________________"

    when "exit"
      puts "Exiting..."
      break
    else
      puts "No such command. Try again"
  end

end
