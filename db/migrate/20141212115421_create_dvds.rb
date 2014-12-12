class CreateDvds < ActiveRecord::Migration
  def change
    create_table :dvds do |t|
      t.integer :volume
      t.timestamps
    end
  end
end
