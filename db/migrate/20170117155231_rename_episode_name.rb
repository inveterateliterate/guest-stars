class RenameEpisodeName < ActiveRecord::Migration[5.0]
  def change
    rename_column :episodes, :name, :episode_title
  end
end
