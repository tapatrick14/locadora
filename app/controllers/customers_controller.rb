## This class controll the operation of CRUD for the customers.
class CustomersController < ApplicationController

	# The index method print all customers.
	def index
		@customers = Customer.order :id
	end

	# The show method shows particular customer.
	def show
		@customer = Customer.find(params[:id])
	end

	# The destroy method delete a particular customer.
	# Receive the id of the customer
	def destroy
		@customer = Customer.find(params[:id])
		@customer.destroy
		redirect_to(action: "index")
	end

	# The new method is responsible to init the customer.
	def new
		@customer = Customer.new
	end

	# The create method create and add a  new customer.
	# Receive the name, last_name, phone and address.
	def create
		@customer = Customer.new(customer_params)
		if @customer.save
			redirect_to(action: "show", id: @customer)
		else
			render action: "new"
		end
	end

	# The edit method select a particular customer.
	def edit
		@customer = Customer.find(params[:id])
	end

	# The update method changes a customer selected in the edit method.
	# Receive the id of the customer
	# Receive the new name, last_name, phone and address
	def update
		@customer = Customer.find(params[:id])
		@customer.update_attributes(customer_params)
		redirect_to action: "show", id: @customer
	end

	private

	def customer_params
		params.require(:customer).permit(:name, :last_name, :phone, :address)
	end
end