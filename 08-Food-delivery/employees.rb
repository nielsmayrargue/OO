class Employees
	attr_accessor :name
	attr_reader :role

		def initialize(name,password)
			@name = name
			@password = password
			@role = ""
		end

end

class Manager < Employees
  attr_accessor :name, :password, :role

	def initialize(name,password)
		super(name,password)
    @role = "manager"
	end

def list_clients
end

def add_client(name, address, phone)
	client = Client.new(name, address, phone)
end

def list_orders
end

def add_order(client,ref_menu, date)
	order = Order.new(client,ref_menu, date)
end

def remove_order
end

def assign_order(order, delivery)
  order.status = "assigned"
  order.delivery = "delivery"
end

def add_menu(ref_menu,food,price)
  menu = Menu.new(ref_menu,food,price)
end

end

class Delivery < Employees

  def initialize(name, password)
    super(name, password)
    @role = "manager"
  end

end