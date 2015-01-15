require 'pry'

step "give I have a movie" do
  @movie = Movie.create({title: 'Movie_01', genre: 'Genre_01'})
end

step "I visted the show page of the movie to delete" do
  visit('movies/' + @movie.id.to_s)
end

step "I chossed the movie to delete" do
  first(:link, "DELETE").click
end

step "Confirm if I want to delete the movie" do
  binding.pry
  page.driver.confirm_messages
end

step "the movie is deleted" do
end
