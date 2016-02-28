class CreateIncomings < ActiveRecord::Migration
  def change
    create_table :incomings do |t|
      t.float :quantity
      t.references :brand, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
