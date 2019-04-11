require 'oystercard'

describe Oystercard do

  it { is_expected.to respond_to(:balance) }

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'increases balance' do
      expect { subject.top_up(1) }.to change { subject.balance }.by(1)
    end

    it 'raises error when limit is exceeded' do
      max_balance = Oystercard::MAX_BALANCE
      subject.top_up(max_balance)
      expect { subject.top_up 1 }.to raise_error "Exceeded limit of #{max_balance}"
    end
  end

  describe "#deduct" do
    it { is_expected.to respond_to(:deduct).with(1).argument }

    it 'deducts balance' do
      expect { subject.deduct(1) }.to change { subject.balance }.by(-1)
    end
  end
end
