def call
  list_movies
  options
  goodbye
end

def list
  puts "This weeks top 3 Movies:"
  puts " "
  @top_three = TopMovies::Movies.today
  @top_three.each.with_index(1) do |movie, i|
    puts "#{i}. '#{movie.name}' - Rotton Tomatoes Score: #{movie.rt_score}"
  end
end

def list_options
  list
  input = nil
  while input != "exit"
    puts " "
    puts "Type the 'number' of the movie you would like information on. Type "list" to see the list of top boxoffice movies."
    input = gets.strip
    if input == "list"
      list
    elsif input.to_i > 0 && input.to_i < 4
