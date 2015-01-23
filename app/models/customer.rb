#Class of the customer.
class Customer < ActiveRecord::Base
  has_and_belongs_to_many :movies
  # VALIDATES_PRESENCE_OF: responsible to do the form fill the attributes required.
  validates_presence_of :name, :last_name, :phone, :address
end
