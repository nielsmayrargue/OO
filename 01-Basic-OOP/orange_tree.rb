class OrangeTree
  
attr_accessor :age, :size, :number_oranges, :death_age

  def initialize
    @age = 0
    @size = 0
    @number_oranges = 0
    @death_age = 27
  end
  
  def measure_height
    @age < @death_age ? "#{@size}m" : "A dead tree can't be measured!"
  end
  
  def count_the_oranges
    @age < @death_age ? "#{number_oranges} oranges" : "A dead tree has no oranges.."
  end
  
  def pick_an_orange
    if @age < @death_age 
      @number_oranges -= 1
      "You pick a delicious juicy orange"

    else 
     "A dead tree has nothing to offer.."
    end
  end
  
  def one_year_passes
    @age += 1
    if @age < @death_age
      @number_oranges = 0
      @number_oranges = rand(118..131)
      @size += 5
      "This year your tree grew to #{@size} m tall, and produced #{@number_oranges} oranges"
    elsif @age == @death_age
      "Oh, no! The tree is too old, and has died.."
    else 
      "A year later, the tree is still dead.."
    end


  end

end

orange_tree = OrangeTree.new
23.times { orange_tree.one_year_passes }
puts(orange_tree.one_year_passes)
# => This year your tree grew to 9.6 m tall, and produced 119 oranges
puts(orange_tree.count_the_oranges)
# => 119 oranges
puts(orange_tree.pick_an_orange)
# => You pick a delicious juicy orange
puts(orange_tree.count_the_oranges)
# => 118 oranges
puts(orange_tree.measure_height)
# => 9.6 m
puts(orange_tree.one_year_passes)
# => This year your tree grew to 10.0 m tall, and produced 125 oranges
puts(orange_tree.one_year_passes)
# => This year your tree grew to 10.4 m tall, and produced 131 oranges
puts(orange_tree.one_year_passes)
# => Oh, no! The tree is too old, and has died..
puts(orange_tree.one_year_passes)
# => A year later, the tree is still dead..
puts(orange_tree.count_the_oranges)
# => A dead tree has no oranges..
puts(orange_tree.pick_an_orange)
# => A dead tree has nothing to offer..
