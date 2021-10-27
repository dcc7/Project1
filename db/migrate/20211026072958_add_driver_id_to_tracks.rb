class AddDriverIdToTracks < ActiveRecord::Migration[6.1]
  def change
    add_column :tracks, :driver_id, :integer
  end
end
