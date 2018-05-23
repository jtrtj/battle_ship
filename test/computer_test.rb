require './test/test_helper.rb'
require './lib/computer.rb'
require './lib/player.rb'
require './lib/ship.rb'
require './lib/board.rb'
require './lib/space.rb'
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
  end

  def test_it_marks_spaces_occupied_after_storing_ship_placement
    computer = Computer.new
    computer.place_destroyer

    assert computer.destroyer_position[0].occupied?
    assert computer.destroyer_position[1].occupied?
  end

  def test_it_wont_choose_a_space_its_destroyer_occupies
    computer = Computer.new
    computer.place_destroyer
    availible_spaces = computer.availible_spaces(computer.carrier_spaces)

    refute availible_spaces.any? {|choice| choice.include?(computer.destroyer_position[0].name)}
    refute availible_spaces.any? {|choice| choice.include?(computer.destroyer_position[1].name)}
  end
end
