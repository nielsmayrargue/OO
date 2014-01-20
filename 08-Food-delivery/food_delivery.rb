require_relative 'orders'
require_relative 'clients'
require_relative 'employees'
require_relative 'menus'
require_relative 'transaction'


class Restaurant
 attr_accessor :name, :location, :phone_number, :employees_number, :customers_number

	def initialize(name, location, phone_number)
		@name = name
		@location = location
		@phone_number = phone_number
		@employees_number = 0
		@customers_number = 0
	end

end

#Test

chez_papillard = Restaurant.new("Chez Papillard", "rue de la Soif", "0189675632") #creation d'un compte restaurant
christine_la_manageuse = Manager.new("Christine la manageuse", "azerty") #Niels crée un manager
jean_le_client = christine_la_manageuse.add_client("Jean le client", "1 rue de la faim", "12") #Christine la manageuse ajoute un nouveau client
menu1 = christine_la_manageuse.add_menu("menu 1", "frites, coca", 100) #Christine la manageuse crée un prempier menu dispo
boris_le_delivery = Delivery.new("Boris le delivery", "ytreza")
puts order_de_jean_le_client = Order.new(jean_le_client,menu1) #Christine la manageuse ajoute un nouvel order à ce client
puts christine_la_manageuse.assign_order(order_de_jean_le_client, boris_le_delivery) #Christien la mangeuse assigne l'ordre de jean le client à boris le delivery