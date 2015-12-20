class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
        t.string :category_name
        t.string :icon_category
        t.timestamps null: false
    end
  end
end
