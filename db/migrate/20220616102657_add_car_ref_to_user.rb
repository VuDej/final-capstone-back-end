class AddCarRefToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :car, foreign_key: true
  end
end
