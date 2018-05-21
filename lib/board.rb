require './lib/space.rb'

class Board
  attr_reader :spaces
  def initialize
    @spaces = [[Space.new('a1'), Space.new('a2'), Space.new('a3'), Space.new('a4')],
                    [Space.new('b1'), Space.new('b2'), Space.new('b3'), Space.new('b4')],
                    [Space.new('c1'), Space.new('c2'), Space.new('c3'), Space.new('c4')],
                    [Space.new('d1'), Space.new('d2'), Space.new('d3'), Space.new('d4')]]
  end

  def print_board
    "    ===========
    . 1 2 3 4
    A #{print_row(0)}
    B #{print_row(1)}
    C #{print_row(2)}
    D #{print_row(3)}
    ==========="
  end

  def print_row(row)
    @spaces[row].map do |space|
      space.status
    end.join(' ')
  end

end

board = Board.new
p board.print_row(0)
puts board.print_board
board.spaces[0][1].occupy
board.spaces[0][1].hit
board.spaces[2][1].hit
puts board.print_board
