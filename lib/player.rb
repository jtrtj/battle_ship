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
    board.firt_space.occupied || board.second_space.occupied
    #make sure ship is not diagonal
    first_space.chars[0] == second_space.chars[0]
    first_space.chars[1] == second_space.chars[1]
    #make sure ship doesn't wrap around the board
    first_space.chars[1]+second_space.chars[1] >= 2
    #record position
  end
  def check_if_spaces_occupied(first, second)
    first =
    if @board.first.occupied || @board.second.occupied
    end
  end
  def place_carrier(first_space, second_space)
  end
end
