require './lib/space.rb'

class Board
  BOARD_SIZE = 4
  attr_reader :spaces
  def initialize
    @spaces = Board.of_size
  end

  def self.of_size
    Array.new(BOARD_SIZE) do |row|
      Array.new(BOARD_SIZE) do |column|
        Space.new(row.to_s + column.to_s)
      end
    end
  end

  def print_board
    [
      '=' * border_length,
      '. 1 2 3 4',
      "A #{print_row(0)}",
      "B #{print_row(1)}",
      "C #{print_row(2)}",
      "D #{print_row(3)}",
      '=' * border_length
    ].join("\n")
  end

  private
  def print_row(row)
    @spaces[row].map do |space|
      space.status
    end.join(' ')
  end

  def border_length
    ((BOARD_SIZE + 1) * 2) + 1
  end
end
