class Twilio::Sms

	def deliver to, from, message
		@client = Twilio::REST::Client.new ENV["account_sid"], ENV["auth_token"]
			begin
				@client.messages.create(
				  from: from,
				  to: to,
				  body: message
				)
				return { status: :ok, message: "Message sent!" }
			rescue Twilio::REST::TwilioError => e
				return { status: :bad_request, message: e.message }
			end	
	end

end