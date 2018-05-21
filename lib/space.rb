class Space
  attr_reader :status,
              :occupied,
              :name

  def initialize(name)
    @name     = name
    @status   = ' '
    @occupied = false
  end

  def occupy
    @occupied = true
  end

  def occupied?
    @occupied
  end
  
  def hit
    if @occupied == true
      @status = 'H'
    else
      @status = 'M'
    end
  end
end
