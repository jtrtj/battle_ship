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
    skip
    player = Player.new
    assert_instance_of Player, player
  end

  def test_player_starts_with_two_ships
    skip
    player = Player.new
    assert_instance_of Ship, player.destroyer
    assert_instance_of Ship, player.carrier
  end

  def test_player_can_place_destroyer
    skip
    player = Player.new
    player.place_destroyer('A2', 'B2')
    assert_equal ['A2', 'B2'], player.destroyer_position
  end

  def test_player_can_place_carrier
    skip
  end

  def test_check_if_spaces_occupued
    player = Player.new
    player.board.spaces[0][0].occupy

    assert player.check_if_spaces_occupied('a1', 'a2')
    refute player.check_if_spaces_occupied('a2', 'a3')
  end

  def test_if_piece_can_be_placed_diagonally
    player = Player.new

    assert player.check_if_diagonal('a1', 'a2')
    refute player.check_if_diagonal('b1', 'a2')
  end

  def test_it_matches_placements_to_spaces
    player = Player.new
    actual = player.match_spaces_and_placements('b2', 'b3')

    assert_equal [player.board.spaces[1][1], player.board.spaces[1][2]], actual
  end

  def test_it_tells_you_if_placement_is_invalid
    player = Player.new
    player.board.spaces[0][0].occupy

    assert_equal "Sorry, one of you spaces is occuppied", player.place_destroyer('a1', 'a2')
    assert_equal "Sorry, ships cannot be placed diagonally", player.place_destroyer('c1', 'b2')
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
end
