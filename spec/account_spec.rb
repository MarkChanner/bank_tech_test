require 'account'

describe Account do

  describe '#balance' do
    it 'should return the balance' do
      expect(subject.balance).to eq 0
    end
  end
end