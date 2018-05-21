class Player
  attr_reader :destroyer,
              :carrier,
              :destroyer_position,
              :carrier_position,
              :board
  def initialize
    @destroyer          = Ship.new(2)
    @carrier            = Ship.new(3)
    @destroyer_position = []
    @carrier_position   = []
    @board              = Board.new
  end

  def place_destroyer(first, second)
    @destroyer_position += [firt_space, second_space]
    #place ship using two coordiantes
    #make sure neither space is occupied
    check_if_spaces_occupied(first, second)
    #make sure ship is not diagonal
    check_if_diagonal(first, second)
    #make sure ship doesn't wrap around the board
    first_space.chars[1]+second_space.chars[1] >= 2
    #record position
  end

  def place_carrier(first_space, second_space)
  end

  def check_if_diagonal(first, second)
    first.chars[0] == second.chars[0] || first.chars[1] == second.chars[1]
  end

  def check_if_spaces_occupied(first, second)
    occupied_spaces.include?(first) || occupied_spaces.include?(second)
  end


  def all_spaces
    @board.spaces.flatten
  end

  def occupied_spaces
    all_spaces.map do |space|
      if space.occupied == true
        space.name
      end
    end
  end

end
