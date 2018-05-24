class Board
  attr_reader :spaces
  def initialize
    @spaces =
    [[Space.new('00'), Space.new('01'), Space.new('02'), Space.new('03')],
    [Space.new('10'), Space.new('11'), Space.new('12'), Space.new('13')],
    [Space.new('20'), Space.new('21'), Space.new('22'), Space.new('23')],
    [Space.new('30'), Space.new('31'), Space.new('32'), Space.new('33')]]
  end

  def print_board
    "===========\n. 1 2 3 4\nA #{print_row(0)}\nB #{print_row(1)}\nC #{print_row(2)}\nD #{print_row(3)}\n==========="
  end

  def print_row(row)
    @spaces[row].map do |space|
      space.status
    end.join(' ')
  end

end
