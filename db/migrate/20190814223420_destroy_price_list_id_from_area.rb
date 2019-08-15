class DestroyPriceListIdFromArea < ActiveRecord::Migration[5.2]
  def change
    remove_column :areas, :price_list_id
  end
end
