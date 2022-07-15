class AddClubNameToOwner < ActiveRecord::Migration[6.1]
  def change
    add_column :owners, :club_name, :string
  end
end
