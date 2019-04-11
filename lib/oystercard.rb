class Oystercard

  attr_reader :balance, :in_journey, :entry_station
  MAX_BALANCE = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @in_journey = false
    @entry_station = entry_station
  end

  def top_up(amount)
    raise "Exceeded limit of #{MAX_BALANCE}" if @balance >= MAX_BALANCE
    @balance += amount
    return "You're card has a balance of #{balance}"
  end

  def in_journey?
   !(!@entry_station)
  end

  def touch_in(station)
    raise 'Insufficient balance' if @balance < MIN_FARE
    @in_journey = true
    @entry_station = station
  end

  def touch_out
    deduct(MIN_FARE)
    @in_journey = false
    @entry_station = nil
  end
end

private

  def deduct(amount)
    @balance -= amount
  end
