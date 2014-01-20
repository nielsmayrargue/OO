class Client
attr_accessor :name, :address, :phone

	def initialize(name, address, phone)
		@name = name
		@address = address
		@phone = phone
		@orders = []
		@balance = 0
	end

end