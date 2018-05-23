require './lib/input_converter.rb'

class Computer
  include InputConverter
  attr_reader :destroyer,
              :carrier,
              :destroyer_position,
              :carrier_position,
              :board,
              :destroyer_spaces

  def initialize(enemy = nil)
    @enemy              = enemy
    @destroyer          = Ship.new(2)
    @carrier            = Ship.new(3)
    @destroyer_position = []
    @carrier_position   = []
    @board              = Board.new
    @destroyer_spaces   =
    [['00', '01'], ['01', '02'], ['02', '03'],
    ['10', '11'], ['11', '12'], ['12', '13'],
    ['20', '21'], ['21', '22'], ['22', '23'],
    ['30', '31'], ['31', '32'], ['32', '33'],
    ['00', '10'], ['01', '11'], ['02', '12'],
    ['03', '13'], ['10', '20'], ['11', '21'],
    ['12', '22'], ['13', '23'], ['20', '30'],
    ['21', '31'], ['22', '32'], ['23', '33']]
  end


  def place_destroyer
      position = pick_a_destroyer_position
      first = position[0]
      second = position[1]
      @destroyer_position += match_spaces_and_placements(first, second)
      mark_spaces_occupied(@destroyer_position)
      "Your Destroyer has been placed."
  end

  def pick_a_destroyer_position
    # pick = rand(1..24)
    @destroyer_spaces[rand(1..24)]
  end

  def place_carrier(first, second)
    first = convert_letter_to_int(first)
    second = convert_letter_to_int(second)
    if check_if_spaces_occupied(first, second) == true
      "Sorry, one of you spaces is occuppied"
    elsif check_if_diagonal(first, second) == false
      "Sorry, ships cannot be placed diagonally"
    #make sure ship doesn't wrap around the board
    else
      @carrier_position += match_spaces_and_placements(first, second)
      make_middle_space_for_carrier
      mark_spaces_occupied(@carrier_position)
      "Your Carrier has been placed."
    end
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

  def check_if_diagonal(first, second)
    first.chars[0].to_i == second.chars[0].to_i || first.chars[1].to_i == second.chars[1].to_i
  end

  def check_if_spaces_occupied(first, second)
    occupied_spaces.include?(first) || occupied_spaces.include?(second)
  end

  def make_middle_space_for_carrier
    if @carrier_position.first.name[0] == @carrier_position.last.name[0]
      mid_space = "#{@carrier_position.first.name[0]}".concat("#{(@carrier_position.last.name[1].to_i) -1}")
      all_spaces.each do |space|
        if space.name == mid_space
          @carrier_position << space
        end
      end
    elsif @carrier_position.first.name[1] == @carrier_position.last.name[1]
      mid_space = "#{(@carrier_position.last.name[0].to_i) -1}".concat("#{@carrier_position.first.name[1]}")
      all_spaces.each do |space|
        if space.name == mid_space
          @carrier_position << space
        end
      end
    end
  end
  # def check_if_ship_wraps(first, second)
  #   # if first placement - second placement is
  # end

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
