class MessagesController < BaseController

	def reply

		watson_client = Watson::Conversation.new
		response = watson_client.message params[:Body]

		if response.code == :ok
			twilio_sms = Twilio::Sms.new
			result = twilio_sms.deliver ENV['twilio_to_number'], ENV['twilio_from_number'], response["output"]["text"][0]
			render status: result[:status], json: result[:message]
		else
			render status: :bad_request, json: {error: "Could not complete your request at the moment! Try again later"}
		end
		
	end

end