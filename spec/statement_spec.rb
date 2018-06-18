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
      expect(subject.display).to eq "date || credit || debit || balance"
    end

    it 'should display headings and a transaction' do
      time = Time.new
      date = time.strftime("%d/%m/%Y")
      subject.add_transaction(1000.00, "", 1000.00)
      expect(subject.display).to eq "date || credit || debit || balance" +
      "\n" + date + " || 1000.00 || || 1000.00"
    end

    it 'should display headings and two transactions' do
      time = Time.new
      date = time.strftime("%d/%m/%Y")
      subject.add_transaction(1000.00, "", 1000.00)
      subject.add_transaction("", 1000.00, 1000.00)
      expect(subject.display).to eq "date || credit || debit || balance" +
      "\n" + date + " || 1000.00 || || 1000.00" + "\n" + date + " || || 1000.00 || 1000.00"
    end
  end

end
