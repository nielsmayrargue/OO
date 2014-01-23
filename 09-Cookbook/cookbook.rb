require_relative 'csv_accessor'

class Cookbook

	def initialize(name)
		@name = name
		@csv_accessor = CsvAccessor.new 
	end

	def list
		@csv_accessor.read
	end

	def add_recipe(recipe_infos)
		@csv_accessor.add(recipe_infos)
	end

	def delete_recipe(recipe_name)
		@csv_accessor.delete(recipe_name)
	end

	def exit
		puts "bye bye buddy ! enjoy your dinner"
	end

end