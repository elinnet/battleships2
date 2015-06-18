require 'board'

describe Board do

  let(:ship) {double :ship, position: 'A1'}

  before do
    subject.place(ship)
  end

  it{ is_expected.to respond_to :place }


  it 'can have a ship' do
    expect(subject.ship_array).to eq [ship]
  end

  it 'reports missed hit when no ship at position' do
    expect(subject.receive_hit "A2").to eq 'Missed'
  end

  it 'can receive a hit on a ship' do
    allow(ship).to receive :destroyed? 
    expect(ship).to receive :hit
    subject.receive_hit "A1"
  end

  it 'can report when all ships are sunk' do
    allow(ship).to receive(:sunk) {true}
    expect(subject).to be_ships_sunk

  end


end