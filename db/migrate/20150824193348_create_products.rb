class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
        t.string :title
        t.string :info_item
        t.string :description
        t.decimal :price
        t.references :subcategory
        t.timestamps null: false
    end
  end
end
