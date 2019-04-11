class Oystercard
  attr_reader :balance, :entry_station, :exit_station, :journeys, :journey
  MAX_BALANCE = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @entry_station = entry_station
    @exit_station = exit_station
    @journeys = []
    @journey = {}
  end

  def top_up(amount)
    raise "Exceeded limit of #{MAX_BALANCE}" if @balance >= MAX_BALANCE
    @balance += amount
    "You're card has a balance of #{balance}"
  end

  def in_journey?
    !(!@entry_station)
  end

  def touch_in(station)
    raise 'Insufficient balance' if @balance < MIN_FARE
    @entry_station = station
    @journey = { entry_station: station }
  end

  def touch_out(station)
    deduct(MIN_FARE)
    @entry_station = nil
    @exit_station = station
    @journey[:exit_station] = station
    @journeys << @journey
  end
end

private

def deduct(amount)
  @balance -= amount
end
