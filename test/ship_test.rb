require './test/test_helper.rb'
require './lib/ship.rb'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ShipTest < MiniTest::Test
  def test_it_exists
    ship = Ship.new(2)
    assert_instance_of Ship, ship
  end

  def test_it_can_have_two_hit_points
    destroyer = Ship.new(2)
    assert_equal 2, destroyer.hit_points
  end

  def test_it_can_have_3_hit_points
    carrier = Ship.new(3)
    assert_equal 3, carrier.hit_points
  end
end
