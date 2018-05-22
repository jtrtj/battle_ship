class Board
  attr_reader :spaces
  def initialize
    @spaces = [[Space.new('00'), Space.new('01'), Space.new('02'), Space.new('03')],
               [Space.new('10'), Space.new('11'), Space.new('12'), Space.new('13')],
               [Space.new('20'), Space.new('21'), Space.new('22'), Space.new('23')],
               [Space.new('30'), Space.new('31'), Space.new('32'), Space.new('33')]]
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

# board = Board.new
# p board.print_row(0)
# puts board.print_board
# board.spaces[0][1].occupy
# board.spaces[0][1].hit
# board.spaces[2][1].hit
# puts board.print_board
