#Class of the DVD.
class Dvd < ActiveRecord::Base
	belongs_to :customer
  validates_presence_of :volume
end
