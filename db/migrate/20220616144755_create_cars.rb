class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :model
      t.string :car_type
      t.decimal :price_per_day
      t.string :transmission
      t.text :description
      t.string :photo

      t.timestamps
    end
  end
end
