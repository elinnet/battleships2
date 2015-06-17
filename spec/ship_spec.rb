require 'ship'

describe Ship do
  
  before(:each) do
    @ship = Ship.new "A1"
  end

  it 'has position when created' do
    expect(@ship.position).to eq "A1"
  end

  it 'can be hit' do
    @ship.hit
    expect(@ship.hit?).to be true
  end

end
