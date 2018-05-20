class Player
  attr_reader :destroyer,
              :carrier,
              :destroyer_position,
              :carrier_position
  def initialize
    @destroyer          = Ship.new(2)
    @carrier            = Ship.new(3)
    @destroyer_position = []
    @carrier_position   = []
  end

  def place_destroyer(firt_space, second_space)
    @destroyer_position += [firt_space, second_space]
  end

  def place_carrier(first_space, second_space)
  end
end
