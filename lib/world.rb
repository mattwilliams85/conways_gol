class World
  attr_accessor :grid, :dimension

  def initialize(dimension)
    @grid = []
    @dimension = dimension
  end

  def define_size
    (@dimension).times do
      @grid << []
    end
  end
end
