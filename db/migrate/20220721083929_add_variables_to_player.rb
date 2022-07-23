class AddVariablesToPlayer < ActiveRecord::Migration[6.1]
  def change
    add_column :players, :full_name, :string
    add_column :players, :is_available, :boolean, null: false, default: true
    add_column :players, :position, :string, null: false, default: "middle"
  end
end
