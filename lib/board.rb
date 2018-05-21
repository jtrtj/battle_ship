require './lib/space.rb'
require 'pry'
class Board
  attr_reader :a1, :a2, :a3, :a4,
              :b1, :b2, :b3, :b4,
              :c1, :c2, :c3, :c4,
              :d1, :d2, :d3, :d4
  def initialize
    @a1 = Space.new
    @a2 = Space.new
    @a3 = Space.new
    @a4 = Space.new
    @b1 = Space.new
    @b2 = Space.new
    @b3 = Space.new
    @b4 = Space.new
    @c1 = Space.new
    @c2 = Space.new
    @c3 = Space.new
    @c4 = Space.new
    @d1 = Space.new
    @d2 = Space.new
    @d3 = Space.new
    @d4 = Space.new
  end

  def print(board_name)
    "    ===========
    . 1 2 3 4
    A #{board_name.a1.status} #{board_name.a2.status} #{board_name.a3.status} #{board_name.a4.status}
    B #{board_name.b1.status} #{board_name.b2.status} #{board_name.b3.status} #{board_name.b4.status}
    C #{board_name.c1.status} #{board_name.c2.status} #{board_name.c3.status} #{board_name.c4.status}
    D #{board_name.d1.status} #{board_name.d2.status} #{board_name.d3.status} #{board_name.d4.status}
    ==========="
  end
end

board = Board.new
# binding.pry
p board
puts board.print(board)
board.c3.occupy
board.c3.hit
board.a2.hit
puts board.print(board)
