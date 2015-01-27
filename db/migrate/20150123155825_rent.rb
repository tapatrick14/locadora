# This class is resposible by join between Actor and Customers in the database.
class Rent < ActiveRecord::Migration
  def change
    create_table :rents do |t|
      t.belongs_to :movie
      t.belongs_to :customer
      t.datetime :time_begin
      t.datetime :time_end
      t.timestamps
    end
  end
end
