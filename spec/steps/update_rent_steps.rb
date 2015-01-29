step "I have a rent" do
  send "There is a employee to login"
  send "I'm logged into the system"
  @rent = Rent.create({time_begin: '2015-01-01', time_end: '2014-04-01', movie_id: 1, customer_id: 2})
end

step "I visted the show page of the rent to update" do
  visit('/movies/1/rents/' + @rent.id.to_s)
end

step "I chossed the rent to update" do
  first(:link, "UPDATE").click
end

step "I fill in a form of the rent with new attributes" do
  select '2015', from: 'rent_time_begin_1i'
  select 'July', from: 'rent_time_begin_2i'
  select '3', from: 'rent_time_begin_3i'
  select '2015', from: 'rent_time_end_1i'
  select 'April', from: 'rent_time_end_2i'
  select '16', from: 'rent_time_end_3i'
  select 'Nome_01 Sobrenome_01', from: 'rent_customer_id'
  click_button 'CONFIRM'
end

step "the rent is modify with success" do
  expect(page).to have_content("RENTED")
end