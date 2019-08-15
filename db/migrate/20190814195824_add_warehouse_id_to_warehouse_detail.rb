class AddWarehouseIdToWarehouseDetail < ActiveRecord::Migration[5.2]
  def change
    add_column :warehouse_details, :warehouse_id, :integer
  end
end
