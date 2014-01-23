require_relative 'cookbook'
require_relative 'user_interface'


UserInterface.new.launch

=begin
#driver tests

cookbook = Cookbook.new("Recettes de Niels")

puts "here are all the recipes : \n"
p cookbook.list

puts "let's add a new recipe"
recipe_infos = { name: "miel pops",
	type: "Petit dej",
	content: "Super recette des miel pops !!!"
}
cookbook.add_recipe(recipe_infos)
p cookbook.list

puts "let's delete the recipe"
cookbook.delete("miel pops")
p cookbook.list

puts "let's exit this cookbook"
p cookbook.exit
=end