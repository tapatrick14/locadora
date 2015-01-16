# This class is resposible by creation to database of the movie. 
class Movie < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genre
      t.timestamps
    end
  end
end
