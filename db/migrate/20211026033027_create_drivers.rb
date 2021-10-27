class CreateDrivers < ActiveRecord::Migration[6.1]
  def change
    create_table :drivers do |t|
      t.text :name
      t.text :country
      t.text :team
      t.date :dob
      t.integer :current_ranking
      t.integer :points
      t.integer :podiums
      t.text :image
      t.text :bio
      t.timestamps
    end
  end
end
