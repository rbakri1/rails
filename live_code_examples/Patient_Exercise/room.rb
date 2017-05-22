class Room
  # STATE
  def initialize(attributes)
    @id = attributes[:id]
    @capacity = attributes[:capacity]       # Fixnum
    @patients = attributes[:patients] || [] # Array of `Patient` instances
  end

  attr_accessor :id

  # BEHAVIOR
  def full?
    @capacity == @patients.length
  end

  def add(patient)   # patient is a `Patient` instance
    if full?
      fail Exception, "The room is full!"
    else
      @patients << patient
      patient.room = self
    end
  end
end










