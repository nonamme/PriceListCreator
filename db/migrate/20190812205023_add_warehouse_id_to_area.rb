class AddWarehouseIdToArea < ActiveRecord::Migration[5.2]
  def change
    add_column :areas, :warehouse_id, :integer
  end
end
