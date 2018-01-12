class RenameFromComment < ActiveRecord::Migration[5.1]
  def change
    rename_column :comments, :restautant_id, :restaurant_id
  end
end
