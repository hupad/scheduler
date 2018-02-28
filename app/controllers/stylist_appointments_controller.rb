class StylistAppointmentsController < BaseController
	before_action :find_stylist, only: [:index, :create]

	def index
		@stylist_appointments = @stylist.appointments
		render status: :ok, json: @stylist_appointments
	end

	def create
		appointment = @stylist.appointments.build(permit_params)
		if appointment.save
			render status: :ok, json: appointment
		else
			render status: :bad_request, json: {errors: appointment.errors.full_messages}
		end
	end


	private
	def find_stylist
		@stylist = Stylist.find(params[:id])
	end

	def permit_params
		params.require(:appointment).permit(:client_id, :start_time, :end_time)
	end
end