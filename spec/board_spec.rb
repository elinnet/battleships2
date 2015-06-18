require 'board'

describe Board do

  it{ is_expected.to respond_to :place }

  it 'can have a ship' do
    ship = double :ship, position: "A1"
    expect(subject.place(ship).length).to eq 1
  end

  it 'reports missed hit when no ship at position' do
    expect(subject.strike "A1").to eq 'Missed'
  end

  it 'can receive a hit on a ship' do
    ship = double :ship, position: "A1"
    subject.place ship
    allow(ship).to receive :hit
    expect(subject.strike "A1").to eq 'Hit'
  end
# when ship in square, expect ship to recieve a hit

  it 'hits a ship in a specified location if there is one' do
    ship = double :ship, position: "A1"
    subject.place ship
    expect(ship).to receive :hit
    subject.strike "A1"    
  end
end