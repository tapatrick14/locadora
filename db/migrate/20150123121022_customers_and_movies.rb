# This class is resposible by join between Movies and Customers in the database. 
class CustomersAndMovies < ActiveRecord::Migration
  def change
    create_table :customers_movies, id: :false do |t|
      t.belongs_to :customer
      t.belongs_to :movie
    end
  end
end
