class Category

attr_accessor :trips

	def initialize(name, range_price)
		@name = name
		@range_price = range_price
		@trips = []
	end

	def to_s
		return "#{name} -- #{@range_price}"
	end

end
