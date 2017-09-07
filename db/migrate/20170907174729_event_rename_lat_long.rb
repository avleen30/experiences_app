class EventRenameLatLong < ActiveRecord::Migration[5.0]
  def change
    rename_column :events, :latitude, :lat
    rename_column :events, :longitude, :lng
  end
end
