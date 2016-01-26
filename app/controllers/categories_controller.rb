class CategoriesController < ApplicationController
    before_action :find_category, only: [:show, :edit, :update, :destroy]

	def index
      @categories = Category.all
	end

	def new
      @category = Category.new
	end

	def create
	  @category = Category.new(category_params)
	  if @category.save
	  	redirect_to categories_path, notice: 'category saved successfully'
	  else
	  	render :new
	  end
	end
    
  def show
  end

	def edit
	end

	def update
	  if @category.update_attributes(category_params)
	  	redirect_to categories_path, notice: 'Category successfully updated'
	  else
	  	render :edit
	  end
	end

	def destroy
		if @category
			@category.destroy
			redirect_to categories_path, notice: 'Category Successfully destroyed'
		else
	    render :index, notice: 'Check with the errors'
	  end
	end

	private

	def category_params
	  params.require(:category).permit(:name, :description)
	end

	def find_category
	  @category = Category.find(params[:id])
	end
end
