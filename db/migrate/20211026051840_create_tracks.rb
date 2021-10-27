class CreateTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :tracks do |t|
      t.text :name
      t.text :country
      t.text :track_type
      t.float :length
      t.integer :race_laps
      t.text :image
      t.timestamps
    end
  end
end
