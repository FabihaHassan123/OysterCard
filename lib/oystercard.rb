class Oystercard
  # allows balance to be accessed outside of the class it is in.
  attr_accessor :balance

  DEFAULT_BALANCE = 0
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  # sets variables for new instances of the class.
  def initialize
    @balance = DEFAULT_BALANCE
    @max = MAX_BALANCE
    @min = MIN_BALANCE
    @status = "not in use"
  end

  def view_balance
    puts balance
  end

  def top_up(amount)
    raise "maximum amount limit reached." if @balance + amount > @max
    @balance += amount
  end

  def in_journey?
    @status == "in use"
  end

  def touch_in
    raise "insufficient funds." if @balance < @min
    @status = "in use"
  end

  def touch_out
    deduct
    @status = "not in use"
  end

  private

  def deduct(amount = 1)
    @balance -= amount
  end



end
