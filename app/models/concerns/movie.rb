# HAS_AND_BELONGS_TO_MANY: responsible to connect with the movies.
# VALIDATES_PRESENCE_OF: always fill the form.
class Movie < ActiveRecord::Base
  has_and_belongs_to_many :actors
  has_many :rents
  validates_presence_of :title, :genre
end