require 'statement'

describe Statement do

  describe '#add_transaction' do
    it 'should add a new transaction to an array' do
      subject.add_transaction(1000.00, "", 1000.00)
      expect(subject.transactions.length).to eq 1
    end
  end

  describe '#display' do
    it 'should display date, credit, debit, and balance headings' do
      expect(subject.display).to eq 'date || credit || debit || balance'
    end
  end

end
