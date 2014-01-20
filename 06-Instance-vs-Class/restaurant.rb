class Restaurant
  @number_of_ratings = 0
  attr_reader :avg_rating, :name
class << self
  attr_accessor :number_of_ratings
end

  def self.number_of_ratings2 #convention veut que le getter s'appelle comme la variable cherchée
    @number_of_ratings
  end

  def self.increment_ratings
    @number_of_ratings += 1
  end

  def initialize(name,address,rating,food_type)
  	@name = name
  	@address = address
  	@food_type = food_type
    @ratings = [rating]
    @avg_rating = rating
    Restaurant.number_of_ratings += 1
  end

  def rate(rating)
    Restaurant.increment_ratings
    @ratings << rating
    sum_of_rating = 0
    @avg_rating = @ratings.inject{|sum_of_rating,x| sum_of_rating + x }.to_f / @ratings.length
  end

end

#tests
quick = Restaurant.new("Quick", "16 rue de la Malbouffe", 0, "junkfood")
kebab = Restaurant.new("Kebab", "Mars", 10, "SublimFood")
puts "#{Restaurant.number_of_ratings2} is the number of ratings using a method-accessor"
puts "#{quick.avg_rating} is the rating of the restaurant #{quick.name}"
puts "#{kebab.avg_rating} is the rating of the restaurant #{kebab.name}"
puts "a rating of #{quick.rate(9)} has beed added to the #{quick.name} Restaurant"
puts "a rating of #{kebab.rate(1)} has beed added to the #{kebab.name} Restaurant"
puts "a rating of #{quick.rate(8)} has beed added to the #{quick.name} Restaurant"
puts "a rating of #{kebab.rate(0)} has beed added to the #{kebab.name} Restaurant"
puts "#{Restaurant.number_of_ratings2} is the number of ratings using a method-accessor"
puts "The average rating of #{quick.name} is #{quick.avg_rating}"
puts "The average rating of #{kebab.name} is #{kebab.avg_rating}"
puts "#{Restaurant.number_of_ratings} is the number of ratings using a class accessor"

