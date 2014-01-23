require_relative 'cookbook'

class UserInterface

  def initialize
    @task = ""
    @cookbook
  end

	def set_up
    puts "welcome in your Cookbook App !"
    puts "Now what is your full name dude ?"
    name = gets.chomp
    file_name = "recipes-csv/#{name}"
    @cookbook = Cookbook.new(file_name)
  end

  def get_new_recipe_infos
    infos = {}

    puts "what's the name of the recipe ?"
    infos[:name] = gets.chomp
    puts "what kind of recipe ?"
    infos[:type] = gets.chomp
    puts "enter the content"
    infos[:content] = gets.chomp
    
    infos
  end

  def get_recipe_name
    puts "here are your recipes. Which one you want to delete ? Type its name"
    list
    return gets.chomp
  end

  def list
    @cookbook.recipes.each_with_index do |recipe, idx|
      puts "#{idx}. #{recipe}"
    end
  end

  def run

    until @task == "4"
      puts "This is the main menu of your Cookbook, #{@name}. Here is what you can do :"
      puts "1 See your list of recipes \n2 Add a new recipe \n3 Delete a recipe \n4 Exit"
      print "Type the number of what you want to do: "
      @task = gets.chomp
      case @task
      when "1"
        list
      when "2"
        @cookbook.add_recipe(get_new_recipe_infos)
      when "3"
        @cookbook.delete_recipe(get_recipe_name)
      end
    end
  end
  
  def launch
    set_up
    run
  end

end
