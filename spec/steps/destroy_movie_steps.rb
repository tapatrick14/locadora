step "give I have a movie" do
  send "There is a employee to login"
  send "I'm logged into the system"
  @movie = Movie.create({title: 'Movie_01', genre: 'Genre_01'})
end

step "I visted the show page of the movie to delete" do
  visit('/movies/' + @movie.id.to_s)
end

step "I chossed the movie to delete" do
  first(:link, "DELETE").click
end

step "Confirm if I want to delete the movie" do
  page.driver.browser.accept_js_confirms
end

step "the movie is deleted" do
end
