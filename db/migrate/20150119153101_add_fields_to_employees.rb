class AddFieldsToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :name, :string
    add_column :employees, :salary, :integer
    add_column :employees, :job, :string
    add_column :employees, :cpf, :string
    add_column :employees, :address, :string
  end
end
