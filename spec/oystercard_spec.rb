require 'oystercard'

describe Oystercard do

  it { is_expected.to respond_to(:balance) }

  describe '#top_up' do
  it { is_expected.to respond_to(:top_up).with(1).argument }
  end


end
