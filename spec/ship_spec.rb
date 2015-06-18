require 'ship'

describe Ship do
  
  before(:each) do
    @ship = Ship.new "A1"
  end

  it 'has position when created' do
    expect(@ship.position).to eq "A1"
  end

  it 'records number of hits' do
    @ship.hit
    expect(@ship.hit_counter).to eq 1
  end

  it 'can have a size' do
    expect(@ship.size 1).to eq 1
  end

  it 'can be sunk' do
    @ship.size 1
    @ship.hit
    expect(@ship).to be_destroyed
  end

  it 'is not sunk initially' do
    @ship.size 1
    expect(@ship).not_to be_destroyed
  end
end

