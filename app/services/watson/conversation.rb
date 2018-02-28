class Watson::Conversation

	def message body

		auth = {
		  username: ENV["watson_user_name"],
		  password: ENV["watson_password"]
		}

		response = HttpService.post(
			ENV["base_watson_url"],
			basic_auth: auth,
			body: {
				input: {
				text: body }
			}.to_json,
			headers: {'Content-Type' => 'application/json'}
		)

		Rails.logger.info "Watson response ======== #{response}"

		response
	end
end