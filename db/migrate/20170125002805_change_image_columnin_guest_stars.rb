class ChangeImageColumninGuestStars < ActiveRecord::Migration[5.0]
  def change
    remove_column :guest_stars, :image_file_name, :string
    remove_column :guest_stars, :image_content_type, :string
    remove_column :guest_stars, :image_file_size, :integer
    remove_column :guest_stars, :image_updated_at, :datetime
    add_column :guest_stars, :image, :string
  end
end
