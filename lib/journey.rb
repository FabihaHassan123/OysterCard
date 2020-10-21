class Journey

attr_accessor :entry_station, :in_journey, :exit_station
  def initialize
    @entry_station
    @exit_station
  end

  def in_journey?
    @entry_station != nil
  end

  def fare
    return 1 if @entry_station != nil && @exit_station != nil
    return 6
  end
end
