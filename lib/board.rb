require './lib/space.rb'

class Board
  attr_reader :spaces
  def initialize
    @spaces = Board.of_size(4)
  end

  def self.of_size(board_size)
    (0..3).map do |space|
      [Space.new(space.to_s+'0'), Space.new(space.to_s+'1'), Space.new(space.to_s+'2'), Space.new(space.to_s+'3')]
    end
  end

  def print_board
    "===========\n. 1 2 3 4\nA #{print_row(0)}\nB #{print_row(1)}\nC #{print_row(2)}\nD #{print_row(3)}\n==========="
  end

  private
  def print_row(row)
    @spaces[row].map do |space|
      space.status
    end.join(' ')
  end

end


[[Space.new('00'), Space.new('01'), Space.new('02'), Space.new('03')],
[Space.new('10'), Space.new('11'), Space.new('12'), Space.new('13')],
[Space.new('20'), Space.new('21'), Space.new('22'), Space.new('23')],
[Space.new('30'), Space.new('31'), Space.new('32'), Space.new('33')]]
