class CreateGuestStars < ActiveRecord::Migration[5.0]
  def change
    create_table :guest_stars do |t|
      t.string :first_name
      t.string :last_name
      t.attachment :image

      t.timestamps
    end
  end
end
