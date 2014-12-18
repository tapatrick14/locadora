#Class of the DVD.
class Dvd < ActiveRecord::Base
	belongs_to :cliente
end
