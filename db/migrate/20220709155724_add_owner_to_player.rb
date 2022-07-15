class AddOwnerToPlayer < ActiveRecord::Migration[6.1]
  def change
    add_column :players, :owner_id, :integer
  end
end
