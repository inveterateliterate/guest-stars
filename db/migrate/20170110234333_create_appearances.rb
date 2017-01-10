class CreateAppearances < ActiveRecord::Migration[5.0]
  def change
    create_table :appearances do |t|
      t.references :guest_star, foreign_key: true
      t.references :series, foreign_key: true
      t.string :character

      t.timestamps
    end
  end
end
