require './test/test_helper.rb'
require './lib/board.rb'
require './lib/player.rb'
require './lib/space.rb'
require './lib/ship.rb'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class BoardTest < MiniTest::Test
  def test_it_exists
    board = Board.new
    assert_instance_of Board, board
  end

  def test_board_is_created_with_sixteen_spaces
    board = Board.new
    assert_equal 16, board.coordiantes.flatten.length
  end

end
