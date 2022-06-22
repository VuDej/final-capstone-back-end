class RemoveandReplaceModelFromcars < ActiveRecord::Migration[7.0]
  def change
    remove_column :cars, :model
    add_column :cars, :car_model, :string
  end
end
