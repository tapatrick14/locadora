#HAS_AND_BELONGS_TO_MANY: responsible to connect with the actors
#ATTR_ACCESSIBLE: responsible to allow the access the attributes of the actors
#TO_LABEL: representation of the class.
class Actor < ActiveRecord::Base
  attr_accessible :true_name, :artistic_name, :date_birth, :movie_ids
  has_and_belongs_to_many :movies

  def to_label
    "#{artistic_name}"
  end
end