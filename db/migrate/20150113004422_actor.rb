class Actor < ActiveRecord::Migration
  def self.up
    create_table :actors do |t|
      t.string :true_name
      t.string :artistic_name
      t.string :date_birth
      t.timestamps
    end
  end

  def self.down
    drop_table :actors
  end
end