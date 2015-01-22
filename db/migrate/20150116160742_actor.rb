# This class is resposible by creation to database of the actor. 
class Actor < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string :true_name
      t.string :artistic_name
      t.datetime :birth
      t.timestamps
    end
  end
end
