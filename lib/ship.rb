class Ship
  attr_reader :hit_points,
              :afloat
  def initialize(size)
    @hit_points = size
    @afloat = true
  end

  def damage
    @hit_points -= 1
    if @hit_points == 0
      @afloat = false
    end
  end
end
