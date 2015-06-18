require 'ship'

describe Ship do
  subject {Ship.new('A1', 1)}
  
  it 'has position when created' do
    expect(subject.position).to eq "A1"
  end

  it 'records number of hits' do
    subject.hit
    expect(subject.hit_counter).to eq 1
  end

  it 'can have a size' do
    expect(subject.size).to eq 1
  end

  it 'can be sunk' do
    subject.hit
    subject.destroyed?
    expect(subject.sunk).to eq true
  end

  it 'is not sunk initially' do
    expect(subject.sunk).to eq false
  end
end

