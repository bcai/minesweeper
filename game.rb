require 'byebug'
require_relative 'board'

class Minesweeper

  def initialize
    @board = Board.random_board
  end

  def reveal_position(pos)
    # array of possible neighboring positions
    neighbor_positions = board.neighbor_positions(pos)

    # create array of neighoring tiles w/ aforementioned array
    neighbor_tiles = neighbor_positions.map do |position|
      board[*position]
    end

    # checks what val the current tile is
    case board[*pos].reveal(neighbor_tiles)
    when :explode
      puts "You lose."
      game_over
    when 0  # current and neighbors both do not have bomb, so recurse
      neighbor_positions.each do |pos|
        reveal_position(pos) unless board[*pos].face_up?
      end
    else
      # there is at least one neighboring bomb
      nil
    end
  end

  attr_reader :board
end
