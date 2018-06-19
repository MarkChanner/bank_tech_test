require 'transaction'

describe Transaction do
  let(:credit_transaction) { Transaction.build(1000.00, "", 1000.00) }
  let(:debit_transaction) { Transaction.build("", 1000.00, 1000.00) }
  let(:invalid_transaction) { Transaction.build(1000.00, 1000.00, 1000.00) }

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

  describe '#display' do
    it 'should show the transaction details' do
      time = Time.new
      date = time.strftime("%d/%m/%Y")
      expect(credit_transaction.show).to eq date + ' || 1000.00 || || 1000.00'
      expect(debit_transaction.show).to eq date + ' || || 1000.00 || 1000.00'
    end

    it 'should raise an error if neither credit or debit are empty strings' do
      expect { invalid_transaction.show }.to raise_error('Either credit or debit should be an empty string')
    end
  end

end
