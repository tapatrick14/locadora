step 'I visted the cadastre page to movie' do
  send "There is a employee to login"
  send "I'm logged into the system"
  visit('/movies/new')
end

step 'I filled out form of the movie correctly' do
  fill_in 'movie_title', with: 'Movie_1'
  fill_in 'movie_genre', with: 'Genre_1'
  click_button 'CONFIRM'
end

step 'I didnt fill out form of the movie correctly' do
  click_button 'CONFIRM'
end

step 'I should see a sign in success message of the movie' do
  expect(page).to_not have_selector("#error_explanation")
end

step 'I should see a sign in failure message of the movie' do
  expect(page).to have_selector("#error_explanation")
end