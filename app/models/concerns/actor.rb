class Actor < ActiveRecord::Base
  attr_accessible :true_name, :artistic_name, :date_birth, :movie_ids
  has_and_belongs_to_many :movies

  def to_label
    "#{artistic_name}"
  end
end