require 'byebug'
require_relative 'board'

class Minesweeper

  def initialize
    @board = Board.random_board
  end

  def reveal_position(pos)
    neighbor_positions = board.neighbor_positions(pos)

    neighbor_tiles = neighbor_positions.map do |position|
      board[*position]
    end

    case board[*pos].reveal(neighbor_tiles)
    when :explode
      puts "You lose."
      game_over
    when 0
      neighbor_positions.each do |pos|
        reveal_position(pos) unless board[*pos].face_up?
      end
    else
      nil
    end
  end

  attr_reader :board
end
