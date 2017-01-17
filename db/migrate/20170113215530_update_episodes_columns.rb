class UpdateEpisodesColumns < ActiveRecord::Migration[5.0]
  def change
      rename_column :episodes, :number, :episode_number
      add_column :episodes, :season_number, :integer
      add_column :episodes, :episode_summary, :text
  end
end
