step "I have a customer to delete" do
  @customer = Customer.create({name: "Name 1", last_name: "Last Name 1", phone: 11111111, address: "Rua 1"})
end

step "I give a destroy in the customer" do
  Customer.destroy(@customer.id)
end

step "The movie is deleted" do
  expect(Customer.find_by(id: @customer.id)).to eq(nil)
end
