step "give I have a movie an a customer" do
  send "There is a employee to login"
  send "I'm logged into the system"
  @movie = Movie.create({title: 'Titulo_01', genre: 'Genero_01'})
  @customer = Customer.create({name: 'Nome_01', last_name: 'Sobrenome_01', phone: 84123456, address: 'Rua_01'})
end

step "I visted the rent page" do
  visit('/movies/' + @movie.id.to_s + '/rents/new')
end

step "I filled out form of the rent correctly" do
  select '2015', from: 'rent_time_begin_1i'
  select 'July', from: 'rent_time_begin_2i'
  select '3', from: 'rent_time_begin_3i'
  select '2015', from: 'rent_time_end_1i'
  select 'April', from: 'rent_time_end_2i'
  select '16', from: 'rent_time_end_3i'
  select 'Nome_01 Sobrenome_01', from: 'rent_customer_id'
  click_button 'CONFIRM'
end

step "I should see a sign in success message of the rent" do
  expect(page).to have_content("RENTED")
end 