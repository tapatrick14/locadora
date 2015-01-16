step "There is a customer" do
  @customer = Customer.create({name: 'Fernando', last_name: 'Da Silva', phone: 88888888, address: 'Rua Nova'})
end

step  'I click in new' do
  visit('customers/new')
end

step 'I filled new customer form correctly' do
  fill_in 'Name', with: 'Fernando'
  fill_in 'Last name', with: 'Da Silva'
  fill_in 'Phone', with: 88888888
  fill_in 'Address', with: 'Rua Nova'
  click_button 'Create Customer'
end

step 'I should see the new customer' do
  expect(page).to have_content("Show")
end

step "I don't filled new customer form correctly" do
   fill_in 'Name', with: ''
  fill_in 'Last name', with: 'Da Silva'
  fill_in 'Phone', with: 88888888
  fill_in 'Address', with: 'Rua Nova'
  click_button 'Create Customer'
end

step 'I should see customer failure message' do
  expect(page).to have_content("can't")
end