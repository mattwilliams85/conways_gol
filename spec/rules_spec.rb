require 'spec_helper'

describe 'Rules' do
  it 'births and kills the appropriate cells' do
    test_world = World.new(10,10)
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
