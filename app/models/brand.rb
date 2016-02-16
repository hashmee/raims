class Brand < ActiveRecord::Base
  belongs_to :category
  validates :size, uniqueness: { scope: [:name, :item] }
  validates :category, presence: true
  after_create :create_code
  paginates_per 15

  searchable do
    string :name
    string :item
    string :item_code
    string :size
    float :quantity
    string :category
  end
  
  def cat_array
  category_array = []
  Category.all.each do |category|
  	category_array << category.name
  end
  	cat_name = category.name
  	cat_code = category_array.index(cat_name)+1
  	"#{cat_code.to_s}" + "#{rand(111..999).to_s}"
  end

  def create_code
  	while Brand.where(item_code: cat_array).present?
  		cat_array
  	end
 	  self.update_attributes(item_code: "#{cat_array}")
  end
end
