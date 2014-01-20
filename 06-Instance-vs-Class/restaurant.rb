class Restaurant
  @number_of_ratings = 0
  attr_reader :avg_rating

  def self.get_nmb_ratings
    @number_of_ratings
  end

  def self.write_nmb_ratings
    @number_of_ratings += 1
  end

  def initialize(name,address,rating,food_type)
  	@name = name
  	@address = address
  	@food_type = food_type
    @ratings = [rating]
    @avg_rating = rating
  end

  #def number_of_rating_reader
  #	@@number_of_ratings
  #end

  def rate(rating)
    Restaurant.write_nmb_ratings
    @ratings << rating
    sum_of_rating = 0
    @avg_rating = @ratings.inject{|sum_of_rating,x| sum_of_rating + x }.to_f / @ratings.length
  end

end

#tests
Quick = Restaurant.new("Quick", "16 rue de la Malbouffe", 0, "junkfood")
Kebab = Restaurant.new("Kebab", "Mars", 10, "SublimFood")
puts Restaurant.get_nmb_ratings
puts Quick.avg_rating
puts Kebab.avg_rating
Quick.rate(9)
Kebab.rate(1)
Quick.rate(9)
Kebab.rate(0)
puts Restaurant.get_nmb_ratings
puts Quick.avg_rating
puts Kebab.avg_rating

