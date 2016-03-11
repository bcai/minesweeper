class Tile

  def initialize(bomb = false)
    @bomb = bomb
    @face_up = false
  end

  def reveal(neighbors)
    return :explode if @bomb

    @adjacent_bomb_count = 0

    neighbors.each do |neighbor|
      @adjacent_bomb_count += 1 if neighbor.bomb?
    end

    @face_up = true
  end

  def to_s
    @face_up ? @adjacent_bomb_count.to_s : " "
  end

  protected
  def bomb?
    @bomb
  end
end
