class Movie < ActiveRecord::Base
  has_and_belongs_to_many :actors
  validates_presence_of :title, :genre
  attr_accessible :title, :genre, :actor_ids
end