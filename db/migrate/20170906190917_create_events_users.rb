class CreateEventsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :events_users do |t|
      t.string :status
      t.integer :rating

      t.timestamps
    end
  end
end
