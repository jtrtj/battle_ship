class Ship
  attr_reader :hit_points
  def initialize(size)
    @hit_points = size
    @afloat = true
  end

  def damage
    @hit_points -= 1
  end

  def afloat
    if @hit_points == 0
      @afloat = false
    end
  end
end
