require './test/test_helper.rb'
require './lib/computer.rb'
require './lib/player.rb'
require './lib/ship.rb'
require './lib/board.rb'
require './lib/space.rb'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ComputerTest < MiniTest::Test
  def test_it_exists
    opponent = Player.new
    computer = Computer.new(opponent)
    assert_instance_of Computer, computer
  end

  def test_computer_starts_with_two_ships
    opponent = Player.new
    computer = Computer.new(opponent)

    assert_instance_of Ship, computer.destroyer
    assert_instance_of Ship, computer.carrier
  end

  def test_it_can_place_destroyer
    opponent = Player.new
    computer = Computer.new(opponent)
    computer.place_destroyer

    assert_equal 2, computer.destroyer_position.length
  end

  def test_it_can_place_carrier
    opponent = Player.new
    computer = Computer.new(opponent)
    computer.place_destroyer
    computer.place_carrier

    assert_equal 3, computer.carrier_position.length
  end
  def test_it_marks_spaces_occupied_after_storing_ship_placement
    opponent = Player.new
    computer = Computer.new(opponent)
    computer.place_destroyer

    assert computer.destroyer_position[0].occupied?
    assert computer.destroyer_position[1].occupied?
  end

  def test_it_wont_choose_a_space_its_destroyer_occupies
    opponent = Player.new
    computer = Computer.new(opponent)
    computer.place_destroyer
    availible_spaces = computer.availible_spaces(computer.carrier_spaces)

    refute availible_spaces.any? {|choice| choice.include?(computer.destroyer_position[0])}
    refute availible_spaces.any? {|choice| choice.include?(computer.destroyer_position[1])}
  end

  def test_computer_can_launch_missle
    opponent = Player.new
    computer = Computer.new(opponent)
    opponent.place_destroyer('a1', 'a2')
    computer.launch_missile(computer.enemy.board.spaces[0][0])

    assert_equal 'H', opponent.board.spaces[0][0].status
    assert_equal 1, opponent.destroyer.hit_points
  end

  def test_computer_can_make_a_guess
    opponent = Player.new
    computer = Computer.new(opponent)
    computer.make_a_guess_with_missile

    assert opponent.all_spaces.any? {|space| space.status.include?('M')}
  end

  def test_it_can_make_a_flat_array_of_all_spaces_on_a_board
    opponent = Player.new
    computer = Computer.new(opponent)
    board_spaces = computer.all_spaces

    assert board_spaces.any? {|space| space.class == Space}
    assert_equal 16, board_spaces.length
  end

end
