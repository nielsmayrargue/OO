class Order_list

  attr_accessor :list

	def initialize
    @list = []
  end 

  def add_order(order)
    @list << order
  end

end