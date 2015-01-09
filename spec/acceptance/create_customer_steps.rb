step "I fill an a form correctly" do
  @name = "Name 1"
  @last_name = "Last Name 1"
  @phone = 11111111
  @address = "Rua 1"
end

step "I give add customer" do
  @customer = Customer.create({name: @name, last_name: @last_name, phone: @phone, address: @address})
end

step "The new customer is created" do
  @customer.reload
  expect(@customer.name).to eq("Name 1")
  expect(@customer.last_name).to eq("Last Name 1")
  expect(@customer.phone).to eq(11111111)
  expect(@customer.address).to eq("Rua 1")
end