class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :name
      t.string :last_name
      t.integer :phone
      t.string :address	
	  t.timestamps
    end
  end
end
