class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :type
      t.string :color
      t.integer :price
      t.integer :doors
      t.string :bags
      t.string :transmission
      t.integer :mileage
      t.integer :seats
      t.text :extras

      t.timestamps
    end
  end
end
