require 'transaction_log'

describe TransactionLog do
  describe '#add_transaction' do
    it 'should add a new transaction to an array' do
      subject.add_transaction(1000.00, "", 1000.00)
      expect(subject.transactions.length).to eq 1
    end
  end
end
