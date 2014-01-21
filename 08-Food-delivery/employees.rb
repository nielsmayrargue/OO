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

  def add_client(restaurant,name, address, phone)
  	client = Client.new(restaurant, name, address, phone)
    restaurant.clients_list << client
    puts "You just added a new client (id = #{client.id_client})"
  end

  def add_list
    @order_list = Order_list.new
  end

  def add_order(order_list,client_name,ref_menu)
  	order = Order.new(order_list,client_name,ref_menu)
    order_list.add_order(order)
    puts "You just added a new order to the order list (id = #{order.id_order})"
  end

  def assign_order(order_list, order_id, delivery)
    order_list.list[order_id].status = "assigned"
     order_list.list[order_id].delivery = "delivery"
    delivery.add_order_to_delivery_list(order)
    puts "you just assigned a new order to deliver"
  end

  def add_menu(restaurant,name_menu ,food,price)
    menu = Menu.new(restaurant,name_menu ,food,price)
    restaurant.menus_list << menu
    puts "you just created a new menu (id = #{menu.id_menu})"
  end

  end

  class Delivery < Employees

    def initialize(name, password)
      super(name, password)
      @role = "delivery"
      @delivery_list =[]
    end

    def add_order_to_delivery_list(order)
      @delivery_list << order
    end

    def deliver
      puts "you need to go to #{@delivery_list[0].order[client][address]}"
      @delivery_list.delete[0]
      puts "you order has been delivered"
    end

end