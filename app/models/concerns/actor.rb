# HAS_AND_BELONGS_TO_MANY: responsible to connect with the movies.
# ATTR_ACCESSIBLE: responsible to allow the access the attributes of the actors.
class Actor < ActiveRecord::Base
  has_and_belongs_to_many :movies

  # TO_LABEL: representation of the class.
  def to_label
    "#{artistic_name}"
  end
end
