require 'account'

describe Account do
  let(:statement) { spy :statement, add_transaction: nil, display: nil }
  let(:statement_class) { double :statement_class, new: statement }
  let(:account) { Account.new(statement_class) }

  describe '#balance' do
    it 'should return the balance' do
      expect(account.balance).to eq 0
    end
  end

  describe '#make_deposit' do
    it 'should add deposited amount to balance' do
      account.make_deposit(10.00)
      expect(account.balance).to eq 10.00
    end

    it 'should call #add_transaction on statement' do
      account.make_deposit(10.00)
      account.make_deposit(10.00)
      expect(statement).to have_received(:add_transaction).twice
    end
  end

  describe '#make_withdrawal' do
    it 'should deduct amount from balance' do
      account.make_deposit(100.00)
      account.make_withdrawal(90.00)
      expect(account.balance).to eq 10.00
    end

    it 'should call #add_transaction on statement' do
      account.make_deposit(10.00)
      account.make_withdrawal(10.00)
      expect(statement).to have_received(:add_transaction).twice
    end

    it 'should not allow balance to go below zero' do
      expect { account.make_withdrawal(10.00) }.to raise_error("Requested amount exceeds available funds")
    end
  end

  describe '#print_statement' do
    it 'should respond to print_statement' do
      expect(account).to respond_to(:print_statement)
    end
  end
end
