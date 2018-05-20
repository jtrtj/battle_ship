require './lib/space.rb'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class SpaceTest < MiniTest::Test
  def test_it_exists
    space = Space.new
    assert_instance_of Space, space
  end

  def test_by_default_there_is_no_ship
    space = Space.new
    assert_equal false, space.ship?
  end
end
