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
    ([ border, top_label ] + actual_board + [ border ]).join("\n")
  end

  private
  def print_row(row)
    @spaces[row].map do |space|
      space.status
    end.join(' ')
  end

  def border
    '=' * (((BOARD_SIZE + 1) * 2) + 1)
  end

  def top_label
    '. '.concat((1..BOARD_SIZE).to_a.join(' '))
  end

  def actual_board
    Array.new(BOARD_SIZE) do |row|
      "#{left_label(row)} #{print_row(row)}"
    end
  end

  def left_label(index, label = "A")
    if index <= 0 then label else left_label(index - 1, label.next) end
  end
end
