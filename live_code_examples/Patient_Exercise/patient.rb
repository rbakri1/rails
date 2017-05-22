class Patient
  # STATE
  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]    #string
    @cured = attributes[:cured] || false    #boolean
  end

  attr_accessor :room
  attr_accessor :id

  # BEHAVIOR
  def cure
    @cured = true
  end
end
