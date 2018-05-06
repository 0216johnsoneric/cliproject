class TopMovies::CLI

  def call
    list_movies
    options
    goodbye
  end

  def list
    puts "This weeks top 3 Movies:"
    puts " "
    @top_movies = TopMovies::Movies.today
    @top_movies.each.with_index(1) do |movie, i|
      puts "#{i}. #{movie.name}"
    end
  end

  def list_options
    input = nil
    while input != "exit"
      puts " "
      puts "Type the 'number' of the movie you would like information on. Type 'list' to see the list of top boxoffice movies. Type 'exit' to exit application."
      input = gets.strip.downcase
      if input.to_i > 0 && input.to_i < 4
        case input
        when "1"
          puts "Information about Movie 1"
          @movie = TopMovies::Movies.scrape_movies_1
          puts " "
        when "2"
          puts "Information about Movie 2"
          @movie = TopMovies::Movies.scrape_movies_2
          puts " "
        when "3"
          puts "Information about Movie 3"
          @movie = TopMovies::Movies.scrape_movies_3
          puts " "
        end
      elsif input == 'list'
        list
      elsif input == 'exit'
        "Sayonara さよなら"
      else
          puts "Type list for list of movies. Type exit to exit application."
      end
    end
  end

  def goodbye
    puts "Check back for more top movie boxoffice information in the future!"
  end
end
