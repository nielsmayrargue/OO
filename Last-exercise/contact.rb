class Contact

	attr_accessor :name, :tel, :email

	def initialize(infos)
		@name = infos[name]
		@tel = infos[tel]
		@email = infos[email]
	end

end