class CreateDvds < ActiveRecord::Migration
  def change
    create_table :dvds do |t|
      t.belongs_to :customer
      t.integer :volume
      t.timestamps
    end
  end
end
