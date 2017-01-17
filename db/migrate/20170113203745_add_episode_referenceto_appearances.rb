class AddEpisodeReferencetoAppearances < ActiveRecord::Migration[5.0]
  def change
    add_reference :appearances, :episode, index: true
  end
end
