class Employees
	attr_accessor :name
	attr_reader :role

		def initialize(name,password,role)
			@name = name
			@password = password
			@role = role
		end

end

class Manager < Employees
  attr_accessor :name, :password, :role

	def initialize(name,password,role)
		super(name,password,role)
	end

def list_clients
end

def add_customers
end

def list_orders
end

def add_order
end

def remove_order
end

def assign_order
end

end