step "There is a customer to delete" do
  @customer = Customer.create({name: 'Fernando', last_name: 'Da Silva', phone: 88888888, address: 'Rua Nova'})
end

step "I visit the page List of Customer" do
  visit("/customers")
end

step "I click in destroy buttom" do
  first(:link, "Destroy").click
end

step "I click in confirm buttom"  do
  page.driver.browser.accept_js_confirms
end

step "I should see customer list" do
  expect(page).to have_content("List of Customer")
end
