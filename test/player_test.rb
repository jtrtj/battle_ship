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
    player_board = Board.new

    assert player.check_if_spaces_occupied('a1', 'a2')
  end
end
