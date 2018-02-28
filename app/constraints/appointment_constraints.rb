class AppointmentConstraints

	def matches?(request)
		start_time = request.params[:appointment][:start_time].to_time
		end_time = request.params[:appointment][:end_time].to_time
		hour = 60*60

		!start_time.past? && !(end_time >= start_time + hour)
	end
end