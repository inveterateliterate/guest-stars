class CreateSeries < ActiveRecord::Migration[5.0]
  def change
    create_table :series do |t|
      t.string :series_name
      t.string :genre
      t.text :summary
      t.string :rating

      t.timestamps
    end
  end
end
