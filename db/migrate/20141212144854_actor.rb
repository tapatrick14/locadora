class Actor < ActiveRecord::Migration
  def change
  	create_table :actors do |t|
  		t.string :popular_name
  		t.string :artistic_name
  		t.string :birthday
  		t.timestamps
  	end
  end
end
