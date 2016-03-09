class Brand < ActiveRecord::Base
  belongs_to :category
  has_many :incomings
  has_many :outgoings
  validates :size, uniqueness: { scope: [:name, :item] }
  validates :category, presence: true
  after_create :create_code
  paginates_per 15
  
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

  def update_category(name)
    category_array = []
    Category.all.each do |category|
      category_array << category.name
    end
    cat_code = category_array.index(name)+1
    "#{cat_code.to_s}" + "#{rand(111..999).to_s}"
  end

  def update_code(category_id)
    category_name = Category.find(category_id).name
    update_category(category_name)
    while Brand.where(item_code: update_category(category_name)).present?
      update_category
    end
    return update_category(category_name)
  end
end
