#Class of the customer.
class Customer < ActiveRecord::Base
	has_many :dvds
  validates_presence_of :name, :last_name, :phone, :address
end
