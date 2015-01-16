step "give I have a movie" do
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
  expect(page).to_not have_selector("#NEW MOVIE")
end

step "Confirm if I dont want to delete the movie" do
  page.driver.browser.reject_js_confirms
end

step "the movie isnt deleted" do
  expect(page).to_not have_selector("#MOVIES")
end