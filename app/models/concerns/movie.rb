#HAS_AND_BELONGS_TO_MANY: responsible to connect with the actors
#VALIDATES_PRESENCE_OF: responsible to form fill the attributes.
#ATTR_ACCESSIBLE: responsible to allow the access the attributes of the actors.
class Movie < ActiveRecord::Base
  has_and_belongs_to_many :actors
  validates_presence_of :title, :genre
  attr_accessible :title, :genre, :actor_ids
end