step "give I have a movie" do
  send "There is a employee to login"
  send "I'm logged into the system"
  @movie = Movie.create({title: 'Movie_01', genre: 'Genre_01'})
end

step "I visted the show page of the movie to update" do
  visit('/movies/' + @movie.id.to_s)
end

step "I chossed the movie to update" do
  first(:link, "UPDATE").click
end

step "I fill in a form of the movie with new attributes" do
  fill_in 'movie_title', with: 'Movie_1'
  fill_in 'movie_genre', with: 'Genre_1'
  click_button 'CONFIRM'
end

step "the movie is modify with success" do
  expect(page).to_not have_selector("#error_explanation")
end

step "I didnt fill in a form of the movie with new attributes" do
  fill_in 'movie_title', with: 'Movie_1'
  fill_in 'movie_genre', with: ''
  click_button 'CONFIRM'
end

step "the movie is modify with failure" do
  expect(page).to have_selector("#error_explanation")
end