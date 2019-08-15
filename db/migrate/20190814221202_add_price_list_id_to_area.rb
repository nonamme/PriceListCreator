class AddPriceListIdToArea < ActiveRecord::Migration[5.2]
  def change
    add_column :areas, :price_list_id, :integer
  end
end
