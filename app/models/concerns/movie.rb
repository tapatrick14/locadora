# HAS_AND_BELONGS_TO_MANY: responsible to connect with the actors.
# ATTR_ACCESSIBLE: responsible to allow the access the attributes of the actors.
# VALIDATES_PRESENCE_OF: responsible to do the form fill the attributes required.
class Movie < ActiveRecord::Base
  has_and_belongs_to_many :actors
  attr_accessible :title, :genre, :actor_ids
  validates_presence_of :title, :genre
end