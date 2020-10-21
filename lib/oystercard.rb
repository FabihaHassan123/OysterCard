require_relative "journey"

class Oystercard
  # allows balance to be accessed outside of the class it is in.
  attr_accessor :balance

  attr_reader :history, :entry_station, :current_journey

  # sets variables for new instances of the class.
  def initialize(balance = 0)
    @balance = balance
    @max = 90
    @min = 1
    @entry_station = nil
    @history = []
    @current_journey
  end

  def view_balance
    @balance
  end

  def top_up(amount)
    raise "maximum amount limit reached." if @balance + amount > @max
    @balance += amount
  end

  def touch_in(entry_station)
    complete_journey if @current_journey != nil
    raise "insufficient funds." if @balance < @min
    @current_journey = Journey.new
    @current_journey.entry_station = entry_station
  end

  def touch_out(exit_station)
    @current_journey = Journey.new if @current_journey == nil
    @current_journey.exit_station = exit_station
    complete_journey
  end

  def journey_history
    @history
  end

  private

  def deduct(amount = 1)
    @balance -= amount
  end

  def complete_journey
    deduct(@current_journey.fare)
    @history << @current_journey
    @current_journey = nil
  end

end
