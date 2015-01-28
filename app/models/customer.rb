#Class of the customer.
class Customer < ActiveRecord::Base
  has_many :rents
  # VALIDATES_PRESENCE_OF: responsible to do the form fill the attributes required.
  validates_presence_of :name, :last_name, :phone, :address

  def full_name
    str = self.name
    str += " #{self.last_name}"
    str
  end
end