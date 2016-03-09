class Incoming < ActiveRecord::Base
  belongs_to :brand
  after_create :add_total_quantity

  def add_total_quantity
  	final_quantity = brand.total_quantity + quantity
  	brand.update_attributes(total_quantity: final_quantity)
  end
end
