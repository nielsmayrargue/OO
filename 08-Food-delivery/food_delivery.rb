require_relative 'orders'
require_relative 'clients'
require_relative 'employees'
require_relative 'menus'
require_relative 'order_list'


class Restaurant
 attr_accessor :name, :location, :phone_number, :employees_list, :clients_list, :menus_list
	def initialize(name, location, phone_number)
		@name = name
		@location = location
		@phone_number = phone_number
		@employees_list = []
		@clients_list = []
    	@menus_list = []
	end

end

#Test

#Configuration du software pour le restaurant
chez_papillard = Restaurant.new("Chez Papillard", "rue de la Soif", "0189675632") 
christine_la_manageuse = Manager.new("Christine la manageuse", "azerty") 
#Préparation par Christine la manageuse de son semestre commercial
christine_la_manageuse.add_menu(chez_papillard, "menu 1", "frites, coca", 100) 
order_list_janvier = christine_la_manageuse.add_list
boris_le_delivery = Delivery.new("Boris le delivery", "ytreza")
#Journée type
christine_la_manageuse.add_client(chez_papillard,"Jean le client", "1 rue de la faim", "12") 
christine_la_manageuse.add_order(order_list_janvier,"Jean le client", 1) 
christine_la_manageuse.assign_order(order_list_janvier,0, boris_le_delivery) 
boris_le_delivery.deliver