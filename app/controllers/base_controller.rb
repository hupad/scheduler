class BaseController < ApplicationController
	skip_before_action :verify_authenticity_token

	rescue_from MissingParamsException, with: :render_error_message


	def render_error_message(exception)
		render status: exception.http_status, 
						json: {
							message: exception.message, 
							description: exception.detailed_message
						}
	end
end