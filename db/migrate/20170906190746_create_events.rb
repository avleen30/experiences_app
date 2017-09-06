class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.string :cover_img
      t.datetime :start_date
      t.datetime :end_date
      t.integer :creator_id
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
