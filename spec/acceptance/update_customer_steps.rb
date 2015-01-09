step "I have a customer to modify" do
  @customer_1 = Customer.create({name: "Name 1", last_name: "Last Name 1", phone: 11111111, address: "Rua 1"})
end

step "I fill in a form with new attributes" do
  @customer_2 = ({name: "Name 2", last_name: "Last Name 2", phone: 22222222, address: "Rua 2"})
end

step "I give Edit in the customer" do
  Customer.update(@customer_1.id, @customer_2)
end

step "The customer is modified" do
  expect(Customer.find_by(id: @customer_1.id, name: "Name 2")).to_not eq(nil)
end