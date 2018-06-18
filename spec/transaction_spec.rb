require 'transaction'

describe Transaction do
  let(:credit_transaction) { Transaction.new(1000.00, "", 1000.00) }
  let(:debit_transaction) { Transaction.new("", 1000.00, 1000.00) }

  it 'should return the date it was constructed' do
    time = Time.new
    expect(credit_transaction.date).to eq time.strftime("%d/%m/%Y")
  end

  describe '#credit' do
    it 'should return an amount if it was given' do
      expect(credit_transaction.credit).to eq 1000.00
    end

    it 'should return an empty string if not given' do
      expect(debit_transaction.credit).to eq ""
    end
  end

  describe '#debit' do
    it 'should return an amount if it was given' do
      expect(debit_transaction.debit).to eq 1000.00
    end

    it 'should return an empty string if not given' do
      expect(credit_transaction.debit).to eq ""
    end
  end

  describe '#new_balance' do
    it 'should return the balance' do
      expect(credit_transaction.new_balance).to eq 1000.00
    end
  end

end
