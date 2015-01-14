#Class of the customer.
class Customer < ActiveRecord::Base
  validates_presence_of :name, :last_name, :phone, :address
end
