require 'statement'

describe Statement do
  date = Time.new.strftime("%d/%m/%Y")
  let(:transaction01) { double :transaction01, display: (date + " || 1000.00 || || 1000.00") }
  let(:transaction02) { double :transaction02, display: (date + " || || 1000.00 || 1000.00") }
  let(:transaction_log) { spy :transaction_log, add_transaction: nil, transactions: [transaction01, transaction02] }
  let(:empty_transaction_log) { spy :transaction_log, add_transaction: nil, transactions: [] }

  describe '#display' do
    it 'should display just date, credit, debit, and balance headings when no transactions made' do
      expect(subject.display(empty_transaction_log)).to eq "date || credit || debit || balance"
    end

    it 'should display headings and two transactions, in reverse chronological order' do
      expect(subject.display(transaction_log)).to eq "date || credit || debit || balance" +
      "\n" + date + " || || 1000.00 || 1000.00" + "\n" + date + " || 1000.00 || || 1000.00"
    end
  end

end
