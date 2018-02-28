class StylistsController < BaseController
	before_action :find_stylist, only: [:update, :show]

	def create

		stylist = Stylist.new(permit_params)
		if stylist.save
			render status: :ok, json: stylist
		else
			render status: :bad_request, json: {errors: stylist.errors.full_messages}
		end
	end

	def show
		render status: :ok, json: @stylist
	end

	def update
		if @stylist.update(permit_params)
			render status: :ok, json: @stylist
		else
			render status: :bad_request, jsoin: {errors: @stylist.errors.full_messages}
		end
	end

	private
	def find_stylist
		@stylist = Stylist.find(params[:id])
	end

	def permit_params
		params.require(:stylist).permit(:first_name, :last_name)
	end

end