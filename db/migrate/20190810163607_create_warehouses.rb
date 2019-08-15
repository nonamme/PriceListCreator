class CreateWarehouses < ActiveRecord::Migration[5.2]
  def change
    create_table :warehouses do |t|
      t.string :warehouse_name
      t.string :product
      t.string :supplier

      t.timestamps
    end
  end
end
