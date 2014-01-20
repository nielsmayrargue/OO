class Order

attr_accessor :status, :delivery

	def initialize(client,ref_menu)
		@client = client
		@ref_menu = ref_menu
		@date = Time.now
		@status = "pending"
		@delivery = ""
	end

end
