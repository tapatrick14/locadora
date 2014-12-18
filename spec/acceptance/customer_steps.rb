

step "I want to view all customers" do 
	@customers = Customer.order :id
end

step "I want to create a new customer" do
	@customer = Customer.new
end

step  "I fill form correctly" do 
	:customer = {name: "Nome 1", last_name: "Sobrenome 1", phone: 111111111, address: "Rua 1"}
end

step "I create a new customer" do 
	@customer = Customer.new(:customer)
end

step "The new customer will be added" do 
	@customer.save
end

step "I want to edit a customer in the firt page" do
end

step "I hava a customer" do 
	:customer = {name: "Nome 1", last_name: "Sobrenome 1", phone: 111111111, address: "Rua 1"}
end
  
step "I fill form correcty with the new name, Nome 2 and the new lastname Sobrenome 2" do 
	:new_customer2 = {name: "Nome 2", last_name: "Sobrenome 2"}
end

step "I give Edit in the customer" do 
	put :update, id: @customer, customer: :new_customer2
end

step "The customer is modify" do 
	@new_customer.reload
	@new_customer.name.should eq("Nome 2")
	@new_customer.last_name.should eq("Sobrenome 2")
end



