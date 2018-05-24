require './test/test_helper.rb'
require './lib/board.rb'
require './lib/space.rb'
require 'minitest/autorun'
require 'minitest/pride'

class BoardTest < MiniTest::Test
  def test_board_is_created_with_sixteen_spaces
    board = Board.new

    assert_instance_of Space, board.spaces[1][1]
    assert_equal 16, board.spaces.flatten.length
  end

  def test_board_can_be_printed
    board = Board.new
    expected = "===========\n. 1 2 3 4\nA        \nB        \nC        \nD        \n==========="
    actual = board.print_board

    assert_equal expected, actual
  end
end
