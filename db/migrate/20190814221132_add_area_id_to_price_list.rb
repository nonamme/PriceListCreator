class AddAreaIdToPriceList < ActiveRecord::Migration[5.2]
  def change
    add_column :price_lists, :area_id, :integer
  end
end
