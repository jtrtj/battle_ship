require './lib/input_converter.rb'

class Player
  include InputConverter
  attr_reader :destroyer,
              :carrier,
              :destroyer_position,
              :carrier_position,
              :board
  attr_writer :destroyer_position,
              :carrier_position,
              :board
  def initialize(enemy = nil)
    @enemy              = enemy
    @destroyer          = Ship.new(2)
    @carrier            = Ship.new(3)
    @destroyer_position = []
    @carrier_position   = []
    @board              = Board.new
  end

  def place_destroyer(first, second)
    first = convert_letter_to_int(first)
    second = convert_letter_to_int(second)
    if check_if_spaces_occupied(first, second) == true
      "Sorry, one of you spaces is occuppied"
    elsif check_if_diagonal(first, second) == false
      "Sorry, ships cannot be placed diagonally"
    #make sure ship doesn't wrap around the board
    else
      @destroyer_position = match_spaces_and_placements(first, second)
      mark_spaces_occupied(@destroyer_position)
      "Your Destroyer has been placed."
    end
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
