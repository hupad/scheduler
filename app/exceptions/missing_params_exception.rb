class MissingParamsException < StandardError
	
	attr_accessor :error_message

	def initialize message
		@error_message = message
	end

	def http_status
		:bad_request
	end

	def message
		@error_message || "Missing Required params!!"
	end

	def detailed_message
		"All feidls are required to process this request. Please verify the API spec and make sure to satisfy all the requirements"
	end

	def to_hash
		{
			description: detailed_message,
			message: message
		}
	end

end