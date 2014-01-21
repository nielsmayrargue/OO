require_relative 'user_interface'
require_relative 'restaurant'
require_relative 'employees'

class User_interface

	def self.set_up_the_app
    puts "What's the restaurant's name ?"
    restaurant_name = gets.chomp
    puts "Any address?"
    restaurant_address = gets.chomp
    puts "A phone number maybe?"
    restaurant_num = gets.chomp
    restaurant = Restaurant.new(restaurant_name, restaurant_address, restaurant_num) 

    infos = {}
    puts "what's the name of the manager?"
    manager_name = gets.chomp
    infos[:name] = manager_name
    puts "what's the password of the manager?"
    manager_password = gets.chomp
    infos[:password] = manager_password
    @manager = restaurant.add_manager(infos,restaurant)
    return @restaurant = restaurant
  end

  def self.indentification(restaurant)
    puts "Welcome in the #{restaurant.name} app !!"
    puts "what is your loggin ?"
    loggin = gets.chomp
    puts "what is your password ?"
    password = gets.chomp
    if @manager.name == loggin && @manager.password == password
      puts "identification: win"
      return true
    end
  end

  def self.go_to_main_menue
    puts "Here is the main menue. What do you want to do ?"
    puts main_menue =  "type 1 to add a new dish \n type 2 to add a delivery boy \n type 3 to take a new order"
    answer = gets.chomp.to_i
    case answer
      when 1
        add_dish
      when 2
        add_boy
      when 3
        take_order
    end
  end 

  def self.add_dish
    puts "what the name of the dish ?"
    dish_name = gets.chomp
    puts "what's the price ?"
    dish_price = gets.chomp
    puts "what's inside?"
    dish_content = gets.chomp
    @manager.add_menu(dish_name, dish_content, dish_price) 
  end

  def self.add_boy
    puts "what's his name ?"
    boy_name = gets.chomp
    puts "what's his password ?"
    boy_password = gets.chomp
    infos = {name: boy_name,
  password: boy_password
}
  @manager.add_delivery(infos,@restaurant)
  go_to_main_menue
  end

  def self.take_order
  end

  def self.console_flow
    go_to_main_menue
  end

  def self.launch
    set_up_the_app
    indentification(@restaurant)
    console_flow
  end


end