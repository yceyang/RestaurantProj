class AddImageToRestaurant < ActiveRecord::Migration[5.1]
  def change
    # add column target table, column name, data type
    add_column :restaurants, :image, :string
  end
end
