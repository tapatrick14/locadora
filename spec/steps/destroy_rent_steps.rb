step "give give I have a rent" do
  send "There is a employee to login"
  send "I'm logged into the system"
  @rent = Rent.create({time_begin: '2015-01-01', time_end: '2014-04-01', movie_id: 1, customer_id: 2})
end

step "I visted the show page of the rent to delete" do
  visit('/movies/1/rents/' + @rent.id.to_s)
end

step "I chossed the rent to delete" do
  first(:link, "DELETE").click
end

step "Confirm if I want to delete the rent" do
  page.driver.browser.accept_js_confirms
end

step "the rent is deleted" do
  expect(page).to_not have_selector("#RENT")
end

step "Confirm if I dont want to delete the rent" do
  page.driver.browser.reject_js_confirms
end

step "the rent isnt deleted" do
  expect(page).to_not have_selector("#NEW RENT")
end