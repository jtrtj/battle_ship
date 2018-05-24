class Computer
  attr_reader :enemy,
              :destroyer,
              :carrier,
              :destroyer_position,
              :carrier_position,
              :board,
              :destroyer_spaces,
              :carrier_spaces

  def initialize(enemy)
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
    @hit_guesses =
      [enemy.board.spaces[0][0], enemy.board.spaces[0][1], enemy.board.spaces[0][2], enemy.board.spaces[0][3],
      enemy.board.spaces[1][0], enemy.board.spaces[1][1], enemy.board.spaces[1][2], enemy.board.spaces[1][3],
      enemy.board.spaces[2][0], enemy.board.spaces[2][1], enemy.board.spaces[2][2], enemy.board.spaces[2][3],
      enemy.board.spaces[3][0], enemy.board.spaces[3][1], enemy.board.spaces[3][2], enemy.board.spaces[3][3],]
  end

  def place_destroyer
    @destroyer_position = pick_spaces(@destroyer_spaces, rand(0..23))
    mark_spaces_occupied(@destroyer_position)
  end

  def place_carrier
    availible_spaces(@carrier_spaces)
    choice_index = rand(0..(@carrier_spaces.length))
    position = pick_spaces(@carrier_spaces, choice_index)
    @carrier_position = position
    mark_spaces_occupied(@carrier_position)
  end

  def make_a_guess_with_missile
    guess = make_a_hit_guess(@hit_guesses)
    launch_missile(guess)
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
    damage_ship(guess)
    hit_or_miss(guess)
  end

  def damage_ship(guess)
    @enemy.destroyer_position.each do |position|
      if position == guess
        @enemy.destroyer.damage
      end
    end
    @enemy.carrier_position.each do |position|
      if position == guess
        @enemy.carrier.damage
      end
    end
  end

  def mark_spaces_occupied(ship_position)
    ship_position.each do |ship|
      ship.occupy
    end
  end

  def make_a_hit_guess(guesses)
    guesses.shuffle!
    guesses.shift
  end

  def hit_or_miss(guess)
    @enemy.all_spaces.each do |space|
      if space == guess
        space.hit
      end
    end
  end

  def all_spaces
    @board.spaces.flatten
  end
end
