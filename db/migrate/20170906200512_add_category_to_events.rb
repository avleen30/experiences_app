class AddCategoryToEvents < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :category, foreign_key: true
  end
end
