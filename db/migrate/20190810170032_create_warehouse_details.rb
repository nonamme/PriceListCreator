class CreateWarehouseDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :warehouse_details do |t|
      t.float :gross_price, precision: 5, scale: 2
      t.float :sum_24_pal, precision: 5, scale: 2
      t.float :price_pellete_per_tone, precision: 5, scale: 2
      t.float :bag_price, precision: 5, scale: 2
      t.float :palette_price, precision: 5, scale: 2
      t.float :order_price, precision: 5, scale: 2

      t.timestamps
    end
  end
end
