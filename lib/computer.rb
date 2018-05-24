require './lib/input_converter.rb'

class Computer
  include InputConverter
  attr_reader :destroyer,
              :carrier,
              :destroyer_position,
              :carrier_position,
              :board,
              :destroyer_spaces,
              :carrier_spaces

  def initialize(enemy = nil)
    @enemy              = enemy
    @destroyer          = Ship.new(2)
    @carrier            = Ship.new(3)
    @destroyer_position = []
    @carrier_position   = []
    @board              = Board.new
    @destroyer_spaces   =
    [[board.spaces[0][0], board.spaces[0][1]], [board.spaces[0][1], board.spaces[0][2]], [board.spaces[0][2], board.spaces[0][3]],
    [board.spaces[1][0], board.spaces[1][1]], [board.spaces[1][1], board.spaces[1][2]], [board.spaces[1][2], board.spaces[1][3]],
    [board.spaces[2][0], board.spaces[2][1]], [board.spaces[2][1], board.spaces[2][2]], [board.spaces[2][2], board.spaces[2][3]],
    [board.spaces[3][0], board.spaces[3][1]], [board.spaces[3][1], board.spaces[3][2]], [board.spaces[3][2], board.spaces[3][3]],
    [board.spaces[0][0], board.spaces[1][0]], [board.spaces[0][1], board.spaces[1][1]], [board.spaces[0][2], board.spaces[1][2]],
    [board.spaces[0][3], board.spaces[1][3]], [board.spaces[1][0], board.spaces[2][0]], [board.spaces[1][1], board.spaces[2][1]],
    [board.spaces[1][2], board.spaces[2][2]], [board.spaces[1][3], board.spaces[2][3]], [board.spaces[2][0], board.spaces[3][0]],
    [board.spaces[2][1], board.spaces[3][1]], [board.spaces[2][2], board.spaces[3][2]], [board.spaces[2][3], board.spaces[3][3]]]
    @carrier_spaces =
    [[board.spaces[0][0], board.spaces[0][1], board.spaces[0][2]], [board.spaces[0][1], board.spaces[0][2], board.spaces[0][3]],
     [board.spaces[1][0], board.spaces[1][1], board.spaces[1][2]], [board.spaces[1][1], board.spaces[1][2], board.spaces[1][3]],
     [board.spaces[2][0], board.spaces[2][1], board.spaces[2][2]], [board.spaces[2][1], board.spaces[2][2], board.spaces[2][3]],
     [board.spaces[3][0], board.spaces[3][1], board.spaces[3][2]], [board.spaces[3][1], board.spaces[3][2], board.spaces[3][3]],
     [board.spaces[0][0], board.spaces[1][0], board.spaces[2][0]], [board.spaces[0][1], board.spaces[1][1], board.spaces[2][1]],
     [board.spaces[0][2], board.spaces[1][2], board.spaces[2][2]], [board.spaces[0][3], board.spaces[1][3], board.spaces[2][3]],
     [board.spaces[1][0], board.spaces[2][0], board.spaces[3][0]], [board.spaces[1][1], board.spaces[2][1], board.spaces[3][1]],
     [board.spaces[1][2], board.spaces[2][2], board.spaces[3][2]], [board.spaces[1][3], board.spaces[2][3], board.spaces[3][3]]]
  end


  def place_destroyer
    @destroyer_position = pick_spaces(@destroyer_spaces, rand(1..24))
    mark_spaces_occupied(@destroyer_position)
  end

  def place_carrier
    availible_spaces(@carrier_spaces)
    choice_index = rand(1..(@carrier_spaces.length))
    position = pick_spaces(@carrier_spaces, choice_index)
    @carrier_position = position
    mark_spaces_occupied(@carrier_position)
  end

  def pick_spaces(ship_spaces, choice_index)
    ship_spaces[choice_index]
  end

  def availible_spaces(choices)
    choices.delete_if {|choice| choice.include?(destroyer_position[0])}
    choices.delete_if {|choice| choice.include?(destroyer_position[1])}
    return choices
  end

  def launch_missile(guess)
    guess = convert_letter_to_int(guess)
    damage_ship(guess)
    @enemy.all_spaces.each do |space|
      if space.name == guess
        space.hit
      end
    end
  end

  def damage_ship(guess)
    @enemy.destroyer_position.each do |position|
      if position.name == guess
        @enemy.destroyer.damage
      end
    end
    @enemy.carrier_position.each do |position|
      if position.name == guess
        @enemy.carrier.damage
      end
    end
  end

  def mark_spaces_occupied(ship_position)
    ship_position.each do |ship|
      ship.occupy
    end
  end
end
