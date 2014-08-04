require 'cell'
require 'world'
require 'rules'
require 'rspec'
require 'pry'

describe 'Cell' do
  it 'Creates a cell' do
    test_cell = Cell.new
    expect(test_cell).to be_an_instance_of (Cell)
  end
  it 'Initializes the cell with life and marked attributes' do
    test_cell = Cell.new
    expect(test_cell.alive).to eq false
    expect(test_cell.used).to eq false
  end
  it 'can make a cell live' do
    test_cell = Cell.new
    test_cell.birth
    expect(test_cell.alive).to eq true
   end
  it 'can make a living cell die' do
    test_cell = Cell.new
    test_cell.birth
    test_cell.kill
    expect(test_cell.alive).to eq false
   end
  it 'can mark a cell as used' do
    test_cell = Cell.new
    test_cell.mark
    expect(test_cell.used).to eq true
   end
end

describe 'World' do
  it 'Creates a world' do
    test_world = World.new(10)
    expect(test_world).to be_an_instance_of (World)
  end
  it 'Creates a grid based on the inputted dimensions' do
    test_world = World.new(20)
    test_world.define_size
    expect(test_world.grid.length).to eq (20)
  end
  it 'Populates present and future world with cells' do
    test_world = World.new(30)
    test_world.define_size
    test_world.populate
    expect(test_world.grid[0][0].class).to eq (Cell)
    expect(test_world.grid[29][29].class).to eq (Cell)
  end
  it 'Seeds the chosen world with births' do
    test_world = World.new(50)
    test_world.define_size
    test_world.populate
    test_world.seed
    any_alive = test_world.grid.any? do |row|
      row.any? { |cell| cell.alive }
    end
    expect(any_alive).to eq true
  end
end

describe 'Rules' do
  it 'births and kills the appropriate cells' do
    test_world = World.new(10)
    test_world.define_size
    test_world.populate
    test_world.grid[0][0].alive = true
    test_world.grid[1][2].alive = true
    test_world.grid[2][2].alive = true
    expect(neighbor_check(test_world.grid,1,1)).to eq "birth"
    expect(neighbor_check(test_world.grid,0,1)).to eq "remain"
    expect(neighbor_check(test_world.grid,4,4)).to eq "remain"
    expect(neighbor_check(test_world.grid,2,2)).to eq "kill"
  end
end
