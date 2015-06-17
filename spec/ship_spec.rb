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

end
