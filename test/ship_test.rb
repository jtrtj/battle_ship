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

  def test_ship_can_take_damage
    destroyer = Ship.new(2)
    destroyer.damage
    assert_equal 1, destroyer.hit_points
  end

  def test_ship_can_be_sunk
    carrier = Ship.new(3)
    carrier.damage
    carrier.damage
    carrier.damage
    assert_equal false, carrier.afloat
  end
end
