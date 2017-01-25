class AddNametoGuestStars < ActiveRecord::Migration[5.0]
  def change
    rename_column :guest_stars, :first_name, :name
    remove_column :guest_stars, :last_name, :string
  end
end
