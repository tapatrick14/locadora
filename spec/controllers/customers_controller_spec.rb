require 'rails_helper'

RSpec.describe CustomersController, :type => :controller do

	subject (:customer){Customer.create}
	subject (:new_customer){{name: "Joao", last_name: "Da silva", phone: 888888 , address: "Rua nao sei"}}
	subject (:new_customer_invalid){{name: "", last_name: "", phone: 888888 , address: "Rua nao sei"}}

	describe "GET #index" do
    context "Test if the page was created " do
      it "Has a 200 a code" do
        get :index
        expect(response.status).to eq(200)
      end
    end
			it "renders the :index view" do
	    	get :index
	    	expect(response.should render_template :index)
	    end
	end

	describe "GET #show"  do
    before :each do
      @customer = Customer.create({name: "Joao", last_name: "Da Silva", phone: 888888 , address: "Rua nao sei"})
    end
		it "assigns the request customer to @customer" do
			get :show, id: @customer
			expect(assigns(:customer)).to eq (@customer)
		end

		it "renders the #show view " do
			get :show, id: @customer
			expect(response.should render_template :show)
		end
	end

	describe "GET #new" do
		it " assigns a new customer to @customer" do
			get :new
			expect(assigns(:customer)).to be_a_new(Customer)
		end
	end

	describe "POST create" do
		context "with valid attributes" do
			it "creates a new customer" do
				expect{ post :create, customer: new_customer}.to change(Customer, :count).by(1)
			end

			it "redirects to the new contact" do
				expect( post :create, customer: new_customer).should redirect_to Customer.last
			end
		end

		context "with invalid atrributes" do
			it "does not save the new customer" do
				expect{ post :create, customer: new_customer_invalid}.to_not change(Customer, :count)
			end
		end
	end

	describe 'PUT update' do
		subject (:new_customer2){{name: "Pedro", last_name: "Vieira", phone: 888888 , address: "Rua nao sei"}}

		before :each do
			@new_customer = Customer.create({name: "Joao", last_name: "Da Silva", phone: 888888 , address: "Rua nao sei"})
		end

		context "valid attributes" do
			it "located the requested @costumer" do
				put :update, id: @new_customer, customer: new_customer2
				assigns(:customer).should eq(@new_customer)
			end

			it "changes @customers attributes" do
				put :update, id: @new_customer, customer: new_customer2
				@new_customer.reload
				@new_customer.name.should eq("Pedro")
				@new_customer.last_name.should eq("Vieira")
			end

			it "redirects to the updated costumer" do
				put :update, id: @new_customer, customer: new_customer2
				response.should redirect_to(action: "show", id: @new_customer)
			end
		end
	end

    describe "DELETE destroy" do

    	before :each do
    		@new_customer = Customer.create(name: "Joao", last_name: "Da Silva", phone: 888888 , address: "Rua nao sei")
    	end

    	it "delete costumer" do
    		expect{
    			delete :destroy, id: @new_customer}.to change(Customer, :count).by(-1)
    	end

    	it "redirects to costumer#index" do
    		delete :destroy, id: @new_customer
    		response.should redirect_to(action: "index")
    	end
    end
end