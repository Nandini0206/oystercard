class Oystercard
  attr_reader :balance

  def initalize
    @balance = 0
  end

  def top_up(amount)
    @balance += amount 
  end
end
