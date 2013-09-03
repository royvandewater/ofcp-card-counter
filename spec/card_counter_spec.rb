require_relative '../lib/ofcp_card_counter/card_counter'

describe CardCounter do
  describe 'probability_of_getting' do
    context 'when 11 of 13 cards have already been dealt' do
      before :each do
        @sut = CardCounter.new(
          :turns_left => 2,
          :cards => ['2C',
                     '2H', '3H', '4H', '5H', '6H',
                     '2S', '3S', '4S', '5S', '6S']
        )
      end

      it 'should calculate a probability of 2/41 when trying to get one of one cards' do
        expect(@sut.probability_of_getting 1, :of => ['JH']).to eq 2.0/41.0
      end

      it 'should calculate a probability of 79/820 when trying to get one of two cards' do
        expect(@sut.probability_of_getting 1, :of => ['JH', 'QH']).to eq 79.0/820.0
      end

      it 'should calculate a probability of 117/820 when trying to get one of three cards' do
        expect(@sut.probability_of_getting 1, :of => ['JH', 'QH', 'KH']).to be_within(0.000001).of 117.0/820.0
      end

      it 'should calculate a probability of 1/820 when trying to get two cards' do
        expect(@sut.probability_of_getting 2, :of => ['JH', 'QH']).to be_within(0.000001).of 1.0/820.0
      end

      it 'should calculate a probability of 3/820 when trying to get any two of three cards' do
        expect(@sut.probability_of_getting 2, :of => ['JH', 'QH', 'KH']).to be_within(0.000001).of 3.0/820.0
      end

      it 'should calculate a probability of 3/410 when trying to get any two of four cards' do
        expect(@sut.probability_of_getting 2, :of => ['JH', 'QH', 'KH', 'AH']).to be_within(0.000001).of 3.0/410.0
      end

      it 'should calculate a probability of 1/82 when trying to get any two of five cards' do
        expect(@sut.probability_of_getting 2, :of => ['10H', 'JH', 'QH', 'KH', 'AH']).to eq 1.0/82.0
      end

      it 'should calculate a probability of 3/164 when trying to get any two of six cards' do
        expect(@sut.probability_of_getting 2, :of => ['9H', '10H', 'JH', 'QH', 'KH', 'AH']).to eq 3.0/164.0
      end

      it 'should calculate a probability of 0 when trying to get three cards' do
        expect(@sut.probability_of_getting 3, :of => ['JH', 'QH', 'KH']).to eq 0
      end
    end

    context 'when 10 of 13 cards have already been dealt' do
      before :each do
        @sut = CardCounter.new(
          :turns_left => 3,
          :cards  => [
            '2H', '3H', '4H', '5H', '6H',
            '2S', '3S', '4S', '5S', '6S'
          ]
        )
      end

      it 'should calculate a probability of 1/11480 when trying to get three cards' do
        expect(@sut.probability_of_getting 3, :of => ['JH', 'QH', 'KH']).to be_within(0.000001).of 1.0/11480.0
      end
    end
  end
end
