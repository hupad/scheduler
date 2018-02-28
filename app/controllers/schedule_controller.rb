class ScheduleController < BaseController
	before_action :find_stylist, only: [:create, :index]

	def index
		render status: :ok, json: @stylist.schedules.where("from_time = ? and to_time = ?", Time.now, 1.week.from_now)
	end

	def create
		@schedule = @stylist.schedules.build(permit_params)
		if @schedule.save
			render status: :ok, json: @schedule
		else
			render status: :bad_request, json: {errors: @schedule.errors.full_messages}
		end
	end


	private
	def find_stylist
		@stylist = Stylist.find(params[:id])
	end

	def permit_params
		params.require(:schedule).permit(:from_time, :to_time)
	end
end