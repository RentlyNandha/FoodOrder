class DeleteColumnToOrder < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :first_name, :last_name
    
  end
end
