# VALIDATES_PRESENCE_OF: responsible to do the form fill the attributes required.
class Movie < ActiveRecord::Base
  validates_presence_of :title, :genre
end