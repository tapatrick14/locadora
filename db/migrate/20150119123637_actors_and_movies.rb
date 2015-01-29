# This class is resposible by join between Actor and Movies in the database. 
class ActorsAndMovies < ActiveRecord::Migration
  def change
    create_table :actors_movies, id: false do |t|
      t.belongs_to :actor
      t.belongs_to :movie
    end
  end
end
