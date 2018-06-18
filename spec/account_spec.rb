require 'account'

describe Account do

  describe '#balance' do
    it 'should return the balance' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#make_deposit' do
    it 'should add deposited amount to balance' do
      subject.make_deposit(10)
      expect(subject.balance).to eq 10
    end
  end
end
