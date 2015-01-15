#HAS_AND_BELONGS_TO_MANY: responsible to connect with the actors
#VALIDATES_PRESENCE_OF: responsible to form fill the attributes.
#ATTR_ACCESSIBLE: responsible to allow the access the attributes of the actors.
class Movie < ActiveRecord::Base
  validates_presence_of :title, :genre
end