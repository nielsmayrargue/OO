require_relative 'csv_accessor'
require_relative 'recipe'

class Cookbook

	def initialize(file_name)
		@csv_accessor = CsvAccessor.new(file_name)
    @saved_data = []
    import_data
    #@saved_data = @csv_accessor.read
	end

  def import_data
    @csv_accessor.read.each do |recipe_array|
      infos = {}
      infos[:name] = recipe_array[0]
      infos[:type] = recipe_array[1]
      infos[:content] = recipe_array[2]
      @saved_data << Recipe.new(infos)
    end
  end

	def recipes
		@saved_data.dup
	end

	def add_recipe(recipe_infos)
    new_recipe = Recipe.new(recipe_infos)
    add_recipe_to_saved_data(new_recipe)
    add_recipe_to_csv(new_recipe)
    puts "the recipe #{recipe_infos[:name]} has been added!"
	end

  def add_recipe_to_csv(new_recipe)
    new_recipe = [new_recipe.name, new_recipe.type, new_recipe.content]
    @csv_accessor.save_a_row_in_csv(new_recipe)
  end

  def add_recipe_to_saved_data(new_recipe)
    @saved_data << new_recipe

  end

	def delete_recipe(recipe_name)
    @saved_data = @saved_data.each do |recipe|
      @saved_data.delete(recipe) if recipe[0] == recipe_name
    end
    @csv_accessor.save(@saved_data)
    puts "the recipe #{recipe_name} has been deleted!"
  end

end