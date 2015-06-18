require 'player'


describe Player do
  let(:board) {double :board, hits: nil, misses: nil, ships_sunk?: false}
  subject {Player.new(board)}

  it 'should be able to place ships on the board' do
    ship = double :ship
    expect(board).to receive(:place)
    subject.place(ship)
  end

  it 'should be able to receive a hit on the board' do
    expect(board).to receive(:receive_hit)
    subject.receive_hit('A1')
  end

  context "receive hit should" do

    it 'add position to hit array when hit' do
      allow(board).to receive(:receive_hit) {'Hit'}
      subject.receive_hit('A1')
      expect(subject.hits).to eq ['A1']
    end

    it 'add position to misses array when missed' do
      allow(board).to receive(:receive_hit) {'Missed'}
      subject.receive_hit('A1')
      expect(subject.misses).to eq ['A1']
    end

  end

  it 'position cannot be struck twice' do
    allow(subject).to receive(:already_struck?) {true}
    expect{subject.receive_hit "A1"}.to raise_error "position already struck"
  end

    it 'notifies user they have lost when all their ships are sunk' do
    allow(board).to receive(:receive_hit) {'Hit'}
    allow(board).to receive(:ships_sunk?) {true}
    expect(subject.receive_hit "A1").to eq "Hit! You have lost the game!"
  end

end


