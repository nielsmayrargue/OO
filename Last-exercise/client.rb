require_relative 'contact'
require_relative 'category'
require_relative 'trip'

class Client

attr_reader :contact

	def initialize(contact)
		@contact = contact
	end

  def search(category, destination)
    puts "here are your potential trips :"
    match = []
    category.trips.each do |trip|
      if trip.destination == destination
        match << trip
      end
    end
    return match
  end

end