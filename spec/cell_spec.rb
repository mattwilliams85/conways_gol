require 'spec_helper'

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

