require './test/test_helper.rb'
require './lib/player.rb'
require './lib/ship.rb'
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

  def test_player_can_place_destroyer
    player = Player.new
    player.place_destroyer('A2', 'B2')
    assert_equal ['A2', 'B2'], player.destroyer_position
    end

  def test_player_can_place_carrier
  end
end
