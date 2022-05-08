class CreatePlants < ActiveRecord::Migration[7.0]
  def change
    create_table :plants do |t|
      t.string :url
      t.string :title
      t.string :description
      t.integer :price
      t.integer :mobile_number

      t.timestamps
    end
  end
end
