class RemoveEndDateFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :end_date, :string
  end
end
