class Transaction
  attr_reader :amount, :date, :time

  def initialize(amount)
    @amount = amount
    @date = Time.now.to_a[3,3]
    @time = Time.now.to_a[0,3]
  end

  def to_s
    return "#{@amount} euros on #{@date.join("/")} at #{@time.reverse.join("'")}"
  end

end