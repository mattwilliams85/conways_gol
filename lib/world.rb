class World
  attr_accessor :grid, :dimension, :new_grid

  def initialize(dimension, percent_alive)
    @grid = []
    @dimension = dimension
    @percent_alive = percent_alive/10
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
        if (rand(@percent_alive..10) == 10)
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

  def count
    count = 0
    @grid.each do |row|
      row.each do |cell|
        if cell.alive == true
          count += 1
        end
      end
    end
    count
  end

  def neighbor_check(grid,row,column)
  neighbors = 0
  size = grid.length - 1
  result = "remain"

#wrap
  next_row = row + 1
  last_row = row - 1
  next_column = column + 1
  last_column = column - 1

  if row == 0
    last_row = size
  end
  if column == 0
    last_column = size
  end
  if row == size
    next_row = 0
  end
  if column == size
    next_column = 0
  end

#count
  if grid[last_row][last_column].alive
    neighbors += 1
  end
  if grid[last_row][column].alive
    neighbors += 1
  end
  if grid[last_row][next_column].alive
    neighbors += 1
  end
  if grid[row][last_column].alive
    neighbors += 1
  end
  if grid[row][next_column].alive
    neighbors += 1
  end
  if grid[next_row][last_column].alive
    neighbors += 1
  end
  if grid[next_row][column].alive
    neighbors += 1
  end
  if grid[next_row][next_column].alive
    neighbors += 1
  end

#rules
  if grid[row][column].alive
    if neighbors < 2
      result = "kill"
    elsif neighbors > 3
      result = "kill"
    end
  else
    if neighbors == 3
      result = "birth"
    end
  end

  result
end

end

