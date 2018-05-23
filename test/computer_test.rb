require './test/test_helper.rb'
require './lib/computer.rb'
require './lib/player.rb'
require './lib/ship.rb'
require './lib/board.rb'
require './lib/space.rb'
require './lib/place_destroyer.rb'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ComputerTest < MiniTest::Test
  def test_it_exists
    computer = Computer.new
    assert_instance_of Computer, computer
  end

  def test_it_can_place_destroyer
    computer = Computer.new
    computer.place_destroyer

    refute computer.destroyer_position.empty?
    assert_equal 2, computer.destroyer_position.length
    assert (computer.destroyer_position & computer.destroyer_spaces).empty?
  end
end
