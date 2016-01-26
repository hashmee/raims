class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.string :item
      t.string :size
      t.string :item_code
      t.string :string
      t.references :category, index: true, foreign_key: true
      t.float :quantity

      t.timestamps null: false
    end
  end
end
