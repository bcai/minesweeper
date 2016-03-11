require_relative 'tile'

class Board
  def self.random_board
    tiles = []
    71.times { tiles << Tile.new }
    10.times { tiles << Tile.new(true) }
    tiles.shuffle!

    Board.new(Array.new(9) { Array.new(9) { tiles.pop } })
  end

  def initialize(grid)
    @grid = grid
  end

  def render
    puts "  #{(0..8).to_a.join(" ")}"
    @grid.each_with_index do |row,index|
      puts "#{index} #{row.join(" ")}"
    end
    nil
  end

  def [](row,col)
    @grid[row][col]
  end
end
