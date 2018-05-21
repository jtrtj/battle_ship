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
    if check_if_spaces_occupied(first, second) == true
      "Sorry, one of you spaces is occuppied"
    elsif check_if_diagonal(first, second) == false
      "Sorry, ships cannot be placed diagonally"
    #make sure ship doesn't wrap around the board
    else
      @destroyer_position += match_spaces_and_placements(first, second)
      mark_spaces_occupied(@destroyer_position)
    end
  end

  def place_carrier(first_space, second_space)
  end

  def check_if_diagonal(first, second)
    first.chars[0] == second.chars[0] || first.chars[1] == second.chars[1]
  end

  def check_if_spaces_occupied(first, second)
    occupied_spaces.include?(first) || occupied_spaces.include?(second)
  end

  def occupied_spaces
    all_spaces.map do |space|
      if space.occupied == true
        space.name
      end
    end
  end

  def all_spaces
    @board.spaces.flatten
  end

  def match_spaces_and_placements(first, second)
    matched = []
    all_spaces.each do |space|
      if space.name == first
        matched << space
      elsif space.name == second
        matched << space
      end
    end
    matched
  end
  def mark_spaces_occupied(ship_position)
    ship_position.each do |ship|
      ship.occupy
    end
  end
end
