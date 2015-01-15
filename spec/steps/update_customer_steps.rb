step "There is a customer to modify" do
  @customer = Customer.create({name: 'Fernando', last_name: 'Da Silva', phone: 88888888, address: 'Rua Nova'})
end

step "I visit the page List of Customer to edit" do
  visit("/customers")
end

step "I click in Edit buttom" do
  first(:link, "Edit").click
end

step "I visti the show page of customer" do
  visit("/customers")
  first(:link, "Show").click
end

step "I I fill in a form of the customer with new attributes" do
  fill_in 'Name', with: 'Fernando'
  fill_in 'Last name', with: 'Da Silva'
  fill_in 'Phone', with: 11111111
  fill_in 'Address', with: 'Rua sem Fim'
  click_button 'Update Customer'
end

step "The customer is modified with success" do
  expect(page).to have_content("Show Customer")
end