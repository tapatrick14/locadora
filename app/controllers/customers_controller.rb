class CustomersController < ApplicationController

	def index
		@customers = Customer.order :id
	end

	def show 
		@customer = Customer.find(params[:id])
	end

	def destroy
		@customer = Customer.find(params[:id])
		@customer.destroy

		redirect_to(action: "index")
	end

	def new 
		@customer = Customer.new
	end

	def customer_params
		params.require(:customer).permit(:name, :last_name, :phone, :address)
	end

	def create
		@customer = Customer.new(customer_params)
		@customer.save
		redirect_to(action: "show", id: @customer)
	end

	def edit
		@customer = Customer.find(params[:id])
	end

	def update
		@customer = Customer.find(params[:id])
		@customer.update_attributes(customer_params)
		redirect_to action: "show", id: @customer
	end
end