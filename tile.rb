class Tile

  def initialize(bomb = false)
    @bomb = bomb
    @face_up = false
    @adjacent_bomb_count = 0
  end

  def reveal(neighbors)
    return :explode if @bomb

    neighbors.each do |neighbor|
      @adjacent_bomb_count += 1 if neighbor.bomb?
    end

    @face_up = true
    @adjacent_bomb_count
  end

  def to_s
    @face_up ? @adjacent_bomb_count.to_s : " "
  end

  protected
  def bomb?
    @bomb
  end
end
