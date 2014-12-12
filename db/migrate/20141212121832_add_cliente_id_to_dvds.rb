class AddClienteIdToDvds < ActiveRecord::Migration
  def change
    add_column :dvds, :user_id, :integer
  end
end
