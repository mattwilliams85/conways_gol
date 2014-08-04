def neighbor_check(grid,row,column)
  neighbors = 0
  size = grid.length - 1
  result = "remain"

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

  # puts "--------"
  # puts "row #{row}"
  # puts "last row #{last_row}"
  # puts "next row #{next_row}"
  # puts "column #{column}"
  # puts "last_column #{last_column}"
  # puts "next_column #{next_column}"

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
