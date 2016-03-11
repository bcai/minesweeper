class Tile

  def initialize(bomb = false)
    @bomb = bomb
    @face_up = false
    @adjacent_bomb_count = 0
  end

  def face_up?
    @face_up
  end

  def reveal(neighbor_tiles)
    return :explode if @bomb

    neighbor_tiles.each do |neighbor_tile|
      @adjacent_bomb_count += 1 if neighbor_tile.bomb?
    end

    @face_up = true
    @adjacent_bomb_count
  end

  def to_s
    return "*" if bomb?
    @face_up ? @adjacent_bomb_count.to_s : " "
  end

  protected
  def bomb?
    @bomb
  end
end
