require 'csv'

class CsvAccessor

  def initialize
    @csv_path = "/home/jubeo/Documents/wagon/OrienteObjet/09-Cookbook/recipes.csv"
  end

  def save
    @saved_recipes = []
    CSV.foreach(@csv_path) do |row|
      @saved_recipes << row
    end
    @saved_recipes
  end

	def read
		CSV.foreach(@csv_path) do |row|
  	 row.each_with_index { |field| print "#{field} " }	
     puts "\n"
    end
	end

  def add(recipe_infos)
    save
    CSV.open(@csv_path, "wb") do |csv|
      @saved_recipes << [recipe_infos[:name], recipe_infos[:type], recipe_infos[:content]]
      @saved_recipes.each { |recipe| csv << recipe }
    end
	end

	def delete(recipe_name)
    save
    @saved_recipes.each do |recipe|
      @saved_recipes.delete(recipe) if recipe[0].to_s == recipe_name.to_s
      @saved_recipes.delete(recipe) if recipe[0].empty?
    end
    CSV.open(@csv_path, "wb") do |csv|
    @saved_recipes.each { |recipe| csv << recipe }
    end
  end

end