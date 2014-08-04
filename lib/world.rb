class World
  attr_accessor :grid, :dimension, :new_grid

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
        if (rand(1..10) == 10)
          cell.birth
        end
      end
    end
  end

  def proliferate
    @new_grid = []

    @grid.each_with_index do |row, x|
        @new_grid << []
      row.each_with_index do |cell, y|
        if neighbor_check(grid,x,y) == "kill"
          @grid[x][y].kill
          @new_grid[x] << grid[x][y]
        elsif neighbor_check(@grid,x,y) == "birth"
          @grid[x][y].birth
          @grid[x][y].mark
          @new_grid[x] << grid[x][y]
        else
          @new_grid[x] << grid[x][y]
        end
      end
    end
    @grid = @new_grid
  end

end
