class Space
  attr_reader :status,
              :occupied
              
  def initialize
    @status = ' '
    @occupied = false
  end

  def occupy
    @occupied = true
  end

  def hit
    if @occupied == true
      @status = 'H'
    else
      @status = 'M'
    end
  end
end
