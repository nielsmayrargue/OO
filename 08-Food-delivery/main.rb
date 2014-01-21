require_relative 'user_interface'
require_relative 'restaurant'
require_relative 'employees'


#Test

User_interface.launch

=begin
#Configuration du software pour le restaurant
chez_papillard = Restaurant.new("Chez Papillard", "rue de la Soif", "0189675632") 
christine_info = { name: "Christine la manageuse",
password: "azerty",
role: "manager"
}
christine_la_manageuse = chez_papillard.add_manager(christine_info, chez_papillard) 
#Préparation par Christine la manageuse de son semestre commercial
puts "what do you want to do ?"
menu_1 = christine_la_manageuse.add_menu("menu 1", "frites et coca", 100) 
order_list_janvier = christine_la_manageuse.add_list
boris_info = {name: "Boris le delivery",
  password: "ytreza"
}
boris_le_delivery = Delivery.new(boris_info,chez_papillard)
#Journée type
jean_le_client = christine_la_manageuse.add_client("Jean le client", "1 rue de la faim", "12") 
order_1 = christine_la_manageuse.add_order(order_list_janvier,"Jean le client", 0) 
christine_la_manageuse.assign_order(order_list_janvier,0, boris_le_delivery) 
puts boris_le_delivery.delivery_list
boris_le_delivery.deliver
puts boris_le_delivery.delivery_list
=end