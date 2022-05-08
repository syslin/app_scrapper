class AddExpirationDateToPlants < ActiveRecord::Migration[7.0]
  def change
    add_column :plants, :expiration_date, :datetime
  end
end
