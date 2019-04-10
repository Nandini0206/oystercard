require 'oystercard'

describe Oystercard do

  it { is_expected.to respond_to(:balance) }

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'increases balance' do
      expect { subject.top_up(1) }.to change { subject.balance }.by(1)
    end
  end

end
