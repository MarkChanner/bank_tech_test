require 'account'

describe Account do

  describe '#balance' do
    it 'should return the balance' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#make_deposit' do
    it 'should add deposited amount to balance' do
      subject.make_deposit(10.00)
      expect(subject.balance).to eq 10.00
    end
  end

  describe '#make_withdrawal' do
    it 'should deduct amount from balance' do
      subject.make_deposit(100.00)
      subject.make_withdrawal(90.00)
      expect(subject.balance).to eq 10.00
    end

    it 'should not allow balance to go below zero' do
      expect { subject.make_withdrawal(10) }.to raise_error("Requested amount exceeds available funds")
    end
  end

end
