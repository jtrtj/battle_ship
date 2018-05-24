require './test/test_helper.rb'
require './lib/player.rb'
require './lib/ship.rb'
require './lib/board.rb'
require './lib/space.rb'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ShipTest < MiniTest::Test
  def test_it_exists
    player = Player.new
    assert_instance_of Player, player
  end

  def test_player_starts_with_two_ships
    player = Player.new
    assert_instance_of Ship, player.destroyer
    assert_instance_of Ship, player.carrier
  end

  def test_player_can_place_destoyer
    player = Player.new
    player.place_destroyer('a2', 'a3')

    expected = [player.board.spaces[0][1], player.board.spaces[0][2]]
    actual = player.destroyer_position
    assert_equal expected, actual

    player_2 = Player.new
    player_2.place_destroyer('a3', 'b3')

    expected = [player_2.board.spaces[0][2], player_2.board.spaces[1][2]]
    actual = player_2.destroyer_position
    assert_equal expected, actual
  end

  def test_player_can_place_carrier
    player = Player.new
    player.place_carrier('b2', 'b4')

    expected = [player.board.spaces[1][1], player.board.spaces[1][3], player.board.spaces[1][2]]
    actual = player.carrier_position
    assert_equal expected, actual

    player_2 = Player.new
    player_2.place_carrier('a3', 'c3')

    expected = [player_2.board.spaces[0][2], player_2.board.spaces[2][2], player_2.board.spaces[1][2]]
    actual = player_2.carrier_position
    assert_equal expected, actual

    player_3 = Player.new
    player_3.place_carrier('b1', 'd1')

    expected = [player_3.board.spaces[1][0], player_3.board.spaces[3][0], player_3.board.spaces[2][0]]
    actual = player_3.carrier_position
    assert_equal expected, actual
  end

  def test_player_can_launch_missile
    opponent = Player.new
    player = Player.new(opponent)
    opponent.place_destroyer('a1', 'a2')
    player.launch_missile('a1')

    assert_equal 'H', opponent.board.spaces[0][0].status
    assert_equal 1, opponent.destroyer.hit_points
  end

  def test_check_if_spaces_occupied
    player = Player.new
    player.board.spaces[0][0].occupy

    assert player.check_if_spaces_occupied('00', '01')
    refute player.check_if_spaces_occupied('01', '02')
  end

  def test_if_piece_can_be_placed_diagonally
    player = Player.new

    assert player.check_if_diagonal('01', '02')
    assert player.check_if_diagonal('00', '10')
    refute player.check_if_diagonal('21', '12')
    refute player.check_if_diagonal('01', '12')
  end

  def test_it_matches_placements_to_spaces
    player = Player.new
    actual = player.match_spaces_and_placements('11', '12')

    assert_equal [player.board.spaces[1][1], player.board.spaces[1][2]], actual
  end

  def test_it_tells_you_if_placement_is_invalid
    player = Player.new
    player.board.spaces[0][0].occupy

    assert_equal "Sorry, one of you spaces is occuppied", player.place_destroyer('a1', 'a2')
    assert_equal "Sorry, ships cannot be placed diagonally", player.place_destroyer('b1', 'a2')
  end

  def test_it_stores_placements_if_valid
    player = Player.new
    player.place_destroyer('b2', 'b3')

    assert_equal [player.board.spaces[1][1], player.board.spaces[1][2]], player.destroyer_position
  end

  def test_it_marks_spaces_occupied_after_storing_ship_placement
    player = Player.new
    player.place_destroyer('b2', 'b3')

    assert player.board.spaces[1][1].occupied?
    assert player.board.spaces[1][2].occupied?
  end

  def test_input_converter_module_works
    player = Player.new
    actual = player.convert_letter_to_int('a1')
    expected = '00'

    assert_equal expected, actual
  end

end
