require_relative 'cookbook'

class UserInterface

  def initialize
    @task ||= ""
  end

	def set_up
    puts "welcome in your Cookbook App !"
    puts "Now what is your name dude ?"
    @name = gets.chomp
    @cookbook = Cookbook.new(@name)
  end

  def get_new_recipe_infos
    puts "what's the name of the recipe ?"
    name = gets.chomp
    puts "what kind of recipe ?"
    type = gets.chomp
    puts "enter the content"
    content = gets.chomp
    recipe_infos = { name: name,
  type: type,
  content: content
}
  end

  def get_name_recipe
    puts "here are your recipes. Which one you want to delete ? Type its name"
    @cookbook.list
    return gets.chomp
  end


  def run

    until @task == "4"
      puts "This is the main menu of your Cookbook, #{@name}. Here is what you can do :"
      puts "1 See your list of recipes \n2 Add a new recipe \n3 Delete a recipe \n4 Exit"
      puts "Type the number of what you want to do"
      @task = gets.chomp
      case @task
      when "1"
        @cookbook.list
      when "2"
        @cookbook.add_recipe(get_new_recipe_infos)
      when "3"
        @cookbook.delete_recipe(get_name_recipe)
      end
    end
  end
  
  def launch
    set_up
    run
  end

end
