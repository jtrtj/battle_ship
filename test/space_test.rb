require './test/test_helper.rb'
require './lib/space.rb'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class SpaceTest < MiniTest::Test
  def test_it_exists
    space = Space.new('a1')
    assert_instance_of Space, space
  end

  def test_space_stores_a_name
    space = Space.new('a1')

    assert_equal 'a1', space.name
  end
  def test_by_default_there_is_no_ship
    space = Space.new('a1')
    assert_equal ' ', space.status
  end

  def test_it_records_a_ship_is_present
    space = Space.new('a1')
    space.occupy
    assert_equal true, space.occupied
  end

  def test_it_records_hit_if_ship_is_present
    space = Space.new('a1')
    space.occupy
    space.hit
    assert_equal 'H', space.status
  end

  def test_it_records_miss_if_ship_is_not_present
    space = Space.new('a1')
    space.hit
    assert_equal 'M', space.status
  end
end
