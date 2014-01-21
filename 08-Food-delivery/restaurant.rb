require_relative 'employees'


class Restaurant
 attr_accessor :name, :location, :phone_number, :employees_list, :clients_list, :menus_list
	def initialize(name, location, phone_number)
		@name = name
		@location = location
		@phone_number = phone_number
		@employees_list = []
		@clients_list = []
    @menus_list = []
    puts "new restaurant created"
	end

	def add_manager(infos, restaurant)
		  manager = Manager.new(infos, restaurant)
      puts "manager has been created"
      @employees_list << manager
      return manager
  end

end

