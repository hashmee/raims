class CreateOutgoings < ActiveRecord::Migration
  def change
    create_table :outgoings do |t|
      t.float :quantity
      t.references :brand, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
