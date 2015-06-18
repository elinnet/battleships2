require 'board'

describe Board do

  it{ is_expected.to respond_to :place }


  it 'can have a ship' do
    ship = double :ship
    subject.place(ship)
    expect(subject.ship_array).to eq [ship]
  end

  it 'reports missed hit when no ship at position' do
    ship = double :ship, position: "A1"
    subject.place(ship)
    expect(subject.strike "A2").to eq 'Missed'
  end

  it 'can receive a hit on a ship' do
    ship = double :ship, position: "A1"
    subject.place ship
    expect(ship).to receive :hit
    subject.strike "A1"
  end

  describe 'strike should' do
    it 'not allow stike in same position twice' do
      ship = double :ship, position: "A1"
      allow(ship).to receive :hit 
      subject.place(ship)
      subject.strike "A1"
      expect{subject.strike "A1"}.to raise_error "position already struck"
    end
  end

# when ship in square, expect ship to recieve a hit

  # it 'hits a ship in a specified location if there is one' do
  #   ship = double :ship, position: "A1"
  #   subject.place ship
  #   expect(ship).to receive :hit
  #   subject.strike "A1"    
  # end



end