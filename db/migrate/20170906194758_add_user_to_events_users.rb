class AddUserToEventsUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :events_users, :user, foreign_key: true
  end
end
