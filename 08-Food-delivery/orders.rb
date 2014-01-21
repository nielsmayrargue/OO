class Order

attr_accessor :status, :delivery

	def initialize(order_list,id_client,id_menu)
		@id_order = order_list.list.index(order_list.list.last)
		@id_client = id_client
		@id_menu = id_menu
		@date = Time.now
		@status = "pending"
		@delivery = ""
	end

end
