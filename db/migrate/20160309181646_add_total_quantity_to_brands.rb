class AddTotalQuantityToBrands < ActiveRecord::Migration
  def change
  	add_column :brands, :total_quantity, :float, default: 0.0
  end
end
