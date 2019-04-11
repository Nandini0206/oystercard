require 'oystercard'

describe Oystercard do

  it { is_expected.to respond_to(:balance) }

  describe '#initialize' do
    it 'assumes user does not start in journey' do
      expect(subject.in_journey?).to eq false
    end
  end

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

  describe '#touch_in' do
    it { is_expected.to respond_to(:touch_in) }

    it 'user is now in journey' do
      min_fare = Oystercard::MIN_FARE
      subject.top_up(min_fare)
      subject.touch_in
      expect(subject.touch_in).to eq true
    end

    it 'raises error if card had insufficient balance' do
      min_fare = Oystercard::MIN_FARE
      expect { subject.touch_in }.to raise_error 'Insufficient balance'
    end
  end

  describe '#touch_out' do
    it { is_expected.to respond_to(:touch_out) }

    it 'user is no longer in journey' do
      min_fare = Oystercard::MIN_FARE
      subject.top_up(min_fare)
      subject.touch_in
      subject.touch_out
      expect(subject.touch_out).to eq false
    end

    it 'reduces the amount by the minimum fare' do
      min_fare = Oystercard::MIN_FARE
      expect { subject.touch_out }.to change { subject.balance }.by(-min_fare)
    end
  end
end
