class ActorsAndMovies < ActiveRecord::Migration
  def self.up
    create_table :actors_movies, id: false do |t|
      t.belongs_to :actor
      t.belongs_to :movie
    end
  end

  def self.down
    drop_table :actors_movies
  end
end


