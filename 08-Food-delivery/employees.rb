require_relative 'clients'
require_relative 'orders'
require_relative 'order_list'
require_relative 'menus'



class Employee
	attr_accessor :name
	attr_reader :role

		def initialize(infos, restaurant)
			@name = infos[:name]
			@password = infos[:password]
      @restaurant = restaurant
		end

end

class Manager < Employee

  attr_accessor :name, :password, :role

	def initialize(infos,restaurant)
		super(infos, restaurant)
  end

  def list_clients
  end

  def add_client(name, address, phone)
  	client = Client.new(@restaurant, name, address, phone)
    @restaurant.clients_list << client
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
    order = order_list.list[order_id]
    order.status = "assigned"
     order_list.list[order_id].delivery = "delivery"
    delivery.add_order_to_delivery_list(order)
    puts "you just assigned a new order to deliver"
  end

  def add_menu(name_menu, food, price)
    menu = Menu.new(@restaurant, name_menu ,food, price)
    @restaurant.menus_list << menu
    puts "you just created a new menu (id = #{menu.id_menu})"
  end

  def add_delivery(infos, restaurant)
    delivery = Delivery.new(infos, restaurant)
      puts "delivery boy has been created"
      @employees_list << delivery
      return delivery
  end

end

  class Delivery < Employee

attr_accessor :delivery_list

    def initialize(infos, restaurant)
      super(infos, restaurant)
      @delivery_list =[]
    end

    def add_order_to_delivery_list(order)
      @delivery_list << order
    end

    def deliver
      puts "you need to get there quickly!"
      self.delivery_list.delete(delivery_list.last)
      puts "you order has been delivered"
    end

end