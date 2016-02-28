class IncomingsController < ApplicationController
	def index
		@incomings = Incoming.all
	end

	def new
		@brand = params[:format]
		@incoming = Incoming.new
	end

	def create
		@incoming = Incoming.new(incoming_params)
		if @incoming.save!
			redirect_to incomings_path, notice: 'Incoming added successfully'
		else
			render :new
		end
	end

  private
  def incoming_params
    params.require(:incoming).permit(:quantity, :brand_id)
  end
end
