class AddEventToEventsUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :events_users, :event, foreign_key: true
  end
end
