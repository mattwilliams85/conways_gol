class World
  attr_accessor :grid, :dimension

  def initialize(dimension)
    @grid = []
    @dimension = dimension
  end

  def define_size
    @dimension.times do
      @grid << []
    end
  end

  def populate
    @grid.each do |row|
      @dimension.times do row << Cell.new
      end
    end
  end

  def seed
    @grid.each do |row|
      row.each do |cell|
        if (rand(1..5) == 5)
          cell.birth
          cell.mark
        end
      end
    end
  end
end
