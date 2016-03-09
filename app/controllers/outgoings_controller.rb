class OutgoingsController < ApplicationController
	def index
		@outgoings = Outgoing.all
	end

	def new
		@brand = params[:format]
		@outgoing = Outgoing.new
	end

	def create
		@outgoing = Outgoing.new(outgoing_params)
		if @outgoing.save!
			redirect_to brands_path, notice: 'outgoing added successfully'
		else
			render :new
		end
	end

  private
  def outgoing_params
    params.require(:outgoing).permit(:quantity, :brand_id)
  end
end
