## This class controll the operation of CRUD for the customers.
class CustomersController < ApplicationController

  # The index method show all customers.
  # == Returns
  # When this method is called, it return a variable @customers with all customers in the database.
  def index
    # The variable @customers receive all customer.
    @customers = Customer.order :id
  end

  # SHOW is responsible to show a determinate customer
  # == Parameters
  # This method receive the id of the customer with you want to show
  # == Returns
  # When this method is called, it return a variable @customer with the determinate id
  def show
    @customer = Customer.find(params[:id])
  end

  # DESTROY is responsible by destruction of the customer.
  # == Parameters
  # This method receive the id of the customer with you want to destroy.
  # == Returns
  # If the customer was successfully destroyed you was receive the message "Customer was successfully destroyed.".
  # If the customer wasnt successfully destroyed you was receive a message of error.
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to(action: "index")
  end

  # NEW is responsible by form filling of the customer.
  # == Returns
  # When this method is called, it return a new customer.
  def new
    # The variable @customer receive the object customer.
    @customer = Customer.new
  end

  # CREATE is responsible by creation of the customer.
  # == Parameters:
  # This method receive the method NEW with CUSTOMER_PARAMS.
  # == Returns
  # If the customer was successfully created you go to the page show customer
  # If the customer wasnt successfully created you was receive a message of error.
  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to(action: "show", id: @customer)
    else
      render action: "new"
    end
  end

  # Edit is responsible to select a determinate customer to edit
  # == Parameters
  # This method receive the id of the customer with you want to edit
  # == Returns
  # When this method is called, it return a variable @customer with the determinate id
  def edit
    @customer = Customer.find(params[:id])
  end

  # UPDATE is responsible by update of the customer.
  # == Parameters
  # It receive the parameters the id of the customer with you want to modifly and
  # the id CUSTOMER_PARAM of the new customer with you want to add.
  # == Returns
  # If the customer was successfully updated you go to the page show customer
  # If the customer wasnt successfully updated you was receive a message of error.
  def update
    @customer = Customer.find(params[:id])
    @customer.update_attributes(customer_params)
    redirect_to action: "show", id: @customer
  end

  private

  # The CUSTOMER_PARAMS you create a hash with all values necessary to created a new customer.
  # == Parameters
  # This method receive with params four string, a name, last name, phone ando a address.
  # == Returns
  # It return a hash with the name, last name, phone and address.
  def customer_params
    params.require(:customer).permit(:name, :last_name, :phone, :address)
  end
end