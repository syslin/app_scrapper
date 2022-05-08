class AddRatingsToPlants < ActiveRecord::Migration[7.0]
  def change
    add_column :plants, :rating, :string
  end
end
