class Outgoing < ActiveRecord::Base
  belongs_to :brand
  after_create :subtract_total_quantity

  def subtract_total_quantity
  	final_quantity = brand.total_quantity - quantity
  	brand.update_attributes(total_quantity: final_quantity)
  end
end
