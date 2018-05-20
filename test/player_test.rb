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
end
