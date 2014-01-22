require_relative 'cookbook'

class UserInterface

	def self.set_up
    puts "welcome in your Cookbook App !"
    puts "Now what is your name dude ?"
    name = gets.chomp
    cookbook = Cookbook.new(name)
  end

  def self.run
    puts "Welcome in your Cookbook, #{name}. Here is what you can do :"
    puts "1 See your list of recipes \n2 Add a new recipe \n3 Delete a recipe \n4 Exit"
    puts "Type the number of what you want to do"
    @task = gets.chomp
  end
  


  def self.launch
    set_up
    run
  end

end
