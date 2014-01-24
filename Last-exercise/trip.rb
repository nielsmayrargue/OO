require_relative 'category'

class Trip 

	attr_reader :destination

	def initialize(destination, category, length, price)
		@destination = destination
		@category = category
		@length = length
		@price = price	
		category.trips << self		
	end

	def to_s
		"Trip to #{@destination}, length = #{@length} for a price of #{@price}"
	end

end
