# This class is resposible by join between actor and movie. 
class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :last_name
      t.integer :phone
      t.string :address	
	  t.timestamps
    end
  end
end
