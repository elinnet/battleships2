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
    expect(subject.strike "A2").to eq 'Missed'
  end

  it 'can receive a hit on a ship' do
    expect(ship).to receive :hit
    subject.strike "A1"
  end

  describe 'strike should' do
    it 'not allow stike in same position twice' do
      allow(ship).to receive :hit 
      subject.strike "A1"
      expect{subject.strike "A1"}.to raise_error "position already struck"
    end
  end

  it 'can report when all ships are sunk' do
    allow(ship).to receive(:destroyed?) {true}
    expect(subject).to be_ships_sunk

  end


end