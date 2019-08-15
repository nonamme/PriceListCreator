class CreatePriceLists < ActiveRecord::Migration[5.2]
  def change
    create_table :price_lists do |t|
      t.integer :number_of_pallets
      t.float :net_rabate, precision: 5, scale: 2
      t.float :net_logistic, precision: 5, scale: 2

      t.timestamps
    end
  end
end
