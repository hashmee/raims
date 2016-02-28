class BrandsController < ApplicationController
	before_action :find_brand, only: [:edit, :update, :destroy]

	def index
		@brands = Brand.all.page params[:page]
	end

	def new
		@brand = Brand.new
	end

	def create
		@brand = Brand.new(brand_params)
		if @brand.save
			redirect_to brands_path, notice: 'Brand saved successfully'
		else
			render :new
		end
	end

	def edit
		
	end

	def update
		binding.pry
		if @brand.update_attributes(brand_params)
			redirect_to brands_path, notice: 'Brand updated Successfully'
		else
			render :edit
		end
	end

	def destroy
		if @brand
			@brand.destroy
			redirect_to brands_path, notice: 'Brand deleted successfully'
		end
	end

	private

	def brand_params
		params.require(:brand).permit(:name, :item, :size, :quantity,
			:item_code, :category_id)
	end

	def find_brand
		@brand = Brand.find(params[:id])
	end
end
