# BELONGS_TO: responsible to connect with the movie and customer.
# VALIDATES_PRESENCE_OF: always fill the form.
class Rent < ActiveRecord::Base
  belongs_to :customer
  belongs_to :movie
  validates_presence_of :time_begin, :time_end
end