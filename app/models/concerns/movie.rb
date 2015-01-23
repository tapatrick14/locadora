# HAS_AND_BELONGS_TO_MANY: responsible to connect with the movies.
# VALIDATES_PRESENCE_OF: always fill the form.
class Movie < ActiveRecord::Base
  has_and_belongs_to_many :actors
  has_and_belongs_to_many :customers
  validates_presence_of :title, :genre

  # TO_LABEL: representation of the class.
  def to_label
    "#{title}"
  end
end