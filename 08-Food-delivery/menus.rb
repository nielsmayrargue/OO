class Menu
  attr_reader :id_menu

	def initialize(restaurant, name_menu, food, price)
    @id_menu = restaurant.menus_list.index(restaurant.menus_list.last)
    @name_menu = name_menu
		@food = food
		@price = price
    puts "new menu created"
	end

end

