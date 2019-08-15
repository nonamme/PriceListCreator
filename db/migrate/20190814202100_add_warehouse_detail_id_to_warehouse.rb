class AddWarehouseDetailIdToWarehouse < ActiveRecord::Migration[5.2]
  def change
    add_column :warehouses, :warehouse_detail_id, :integer
  end
end
