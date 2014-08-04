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
end
