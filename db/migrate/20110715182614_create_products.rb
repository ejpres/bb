class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :sku
      t.integer :price
      t.string :image
      t.integer :category_id

      t.timestamps
    end
  end
end
