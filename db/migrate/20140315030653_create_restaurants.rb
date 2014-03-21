class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.text :address
      t.text :phone_number
      t.string :photo

      t.timestamps
    end
  end
end
