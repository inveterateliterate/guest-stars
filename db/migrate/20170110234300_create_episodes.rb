class CreateEpisodes < ActiveRecord::Migration[5.0]
  def change
    create_table :episodes do |t|
      t.string :name
      t.references :series, foreign_key: true
      t.integer :year

      t.timestamps
    end
  end
end
