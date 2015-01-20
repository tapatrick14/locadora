class Employee < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates_presence_of :name, :cpf, :salary, :address, :job
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
