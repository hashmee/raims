class Category < ActiveRecord::Base
	belongs_to :brand

	def to_s
		name
	end
end
