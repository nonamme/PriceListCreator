class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.integer :number
      t.text :post_codes

      t.timestamps
    end
  end
end
