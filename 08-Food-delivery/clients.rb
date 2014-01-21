class Client
attr_accessor :name, :address, :phone, :id_client

	def initialize(restaurant, name, address, phone)
		@name = name
		@address = address
		@phone = phone
		@orders = []
		@balance = 0
		@id_client = restaurant.clients_list.index(restaurant.clients_list.last)
	end

end