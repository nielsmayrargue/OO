#driver test

require_relative 'contact'
require_relative 'book'
require_relative 'client'
require_relative 'category'
require_relative 'trip'

#setting_up a new client
infos_de_joe = {
	name: "joe",
	tel: "0689348899",
	email: "joe@gmail.com" 

}
contacts_de_joe = Contact.new(infos_de_joe)
joe_le_client = Client.new(contacts_de_joe)

#setting_up categories & trips

book = Book.new
cheap_category = Category.new("cheap category",(0..500))
expensive_category = Category.new("expensive category",(501..2000))

trip_1 = Trip.new("Paris", expensive_category, "2 weeks", 1500)
trip_2 = Trip.new("Tombouctou", cheap_category, "4 weeks", 250)
trip_3 = Trip.new("London", expensive_category, "1 week", 1700)
trip_4 = Trip.new("London", expensive_category, "1 week",1200)

puts expensive_category.trips

#Exemple applicatif
puts joe_le_client.search(expensive_category, "London")


