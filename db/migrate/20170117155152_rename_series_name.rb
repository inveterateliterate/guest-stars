class RenameSeriesName < ActiveRecord::Migration[5.0]
  def change
    rename_column :series, :series_name, :series_title
  end
end
