require 'oystercard'

describe Oystercard do
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  let(:journey) { { entry_station: entry_station, exit_station: exit_station } }

  it { is_expected.to respond_to(:balance) }

  describe '#initialize' do
    it 'assumes user does not start in journey' do
      expect(subject.in_journey?).to eq false
    end

    it 'has an empty list of journeys by default' do
      expect(subject.journey).to be_empty
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
    it 'raises error if card had insufficient balance' do
      expect { subject.touch_in(entry_station) }.to raise_error 'Insufficient balance'
    end

    context 'when user has minimum fare' do
      before do
        min_fare = Oystercard::MIN_FARE
        subject.top_up(min_fare)
      end
      it 'user is now in journey' do
        subject.touch_in(entry_station)
        expect(subject.in_journey?).to eq true
      end

      it 'remembers the entry station' do
        subject.touch_in(entry_station)
        expect(subject.entry_station).to eq entry_station
      end
    end
  end

  describe '#touch_out' do
    it { is_expected.to respond_to(:touch_out) }

    before do
      min_fare = Oystercard::MIN_FARE
      subject.top_up(min_fare)
    end
    it 'user is no longer in journey' do
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.in_journey?).to eq false
    end

    it 'reduces the amount by the minimum fare' do
      min_fare = Oystercard::MIN_FARE
      expect { subject.touch_out(exit_station) }.to change { subject.balance }.by(-min_fare)
    end

    it 'remembers the exit station' do
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.exit_station).to eq exit_station
    end

    it 'store one journey' do
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.journeys).to include(journey)
    end
  end
end
