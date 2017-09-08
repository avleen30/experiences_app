class AddColumnsToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :time, :string
  end
end
