class Recipe

attr_reader :name, :type, :content

	def initialize(infos)
		@name = infos[:name]
		@type = infos[:type]
		@content = infos[:content]
	end

	def to_s
		return "#{@name}, #{@type}, #{@content}"
	end

end
