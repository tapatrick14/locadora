#Class of the customer.
class Customer < ActiveRecord::Base
	has_many :dvds
end
