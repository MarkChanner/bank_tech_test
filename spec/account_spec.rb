require 'account'

describe Account do
  let(:statement) { spy :statement, display: nil }
  let(:statement_class) { double :statement_class, new: statement }

  let(:transaction_log) { spy :transaction_log, add_transaction: nil }
  let(:transaction_log_class) { double :transaction_log_class, new: transaction_log }

  let(:account) { Account.new(transaction_log_class, statement_class) }

  describe '#make_deposit' do
    it 'should add deposited amount to balance' do
      account.make_deposit(10.00)
      expect(account.balance).to eq 10.00
    end

    it 'should call #add_transaction on transaction_log' do
      account.make_deposit(10.00)
      account.make_deposit(10.00)
      expect(transaction_log).to have_received(:add_transaction).twice
    end
  end

  describe '#make_withdrawal' do
    it 'should deduct amount from balance' do
      account.make_deposit(100.00)
      account.make_withdrawal(90.00)
      expect(account.balance).to eq 10.00
    end

    it 'should call #add_transaction on transaction_log' do
      account.make_deposit(10.00)
      account.make_withdrawal(10.00)
      expect(transaction_log).to have_received(:add_transaction).twice
    end

    it 'should not allow balance to go below zero' do
      expect { account.make_withdrawal(10.00) }.to raise_error("Requested amount exceeds available funds")
    end
  end

  describe '#print_statement' do
    it 'should call display method on statement' do
      account.print_statement
      expect(statement).to have_received(:display)
    end
  end
end
