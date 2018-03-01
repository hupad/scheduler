class HTTParty::Response

	def	success?
		(self.code == 200)
	end
end