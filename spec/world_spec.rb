describe 'World' do
  it 'Creates a world' do
    test_world = World.new(10,10)
    expect(test_world).to be_an_instance_of (World)
  end
  it 'Creates a grid based on the inputted dimensions' do
    test_world = World.new(20,10)
    test_world.define_size
    expect(test_world.grid.length).to eq (20)
  end
  it 'Populates present and future world with cells' do
    test_world = World.new(30,10)
    test_world.define_size
    test_world.populate
    expect(test_world.grid[0][0].class).to eq (Cell)
    expect(test_world.grid[29][29].class).to eq (Cell)
  end
  it 'Seeds the chosen world with births' do
    test_world = World.new(50,10)
    test_world.define_size
    test_world.populate
    test_world.seed
    any_alive = test_world.grid.any? do |row|
      row.any? { |cell| cell.alive }
    end
    expect(any_alive).to eq true
  end
  it 'Proliferates into new grid' do
    test_world = World.new(50,10)
    test_world.define_size
    test_world.populate
    test_world.seed
    test_world.proliferate
    any_alive = test_world.new_grid.any? do |row|
      row.any? { |cell| cell.alive }
    end
    expect(any_alive).to eq true
  end
end
