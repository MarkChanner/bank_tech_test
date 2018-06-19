class Account
  attr_reader :balance, :transaction_log

  def initialize(transaction_log_class = TransactionLog , statement_class = Statement)
    @transaction_log = transaction_log_class.new
    @statement = statement_class.new
    @balance = 0
  end

  def make_deposit(amount)
    @balance += amount
    transaction_log.add_transaction(amount, "", balance)
  end

  def make_withdrawal(amount)
    raise 'Requested amount exceeds available funds' if balance - amount < 0
    @balance -= amount
    transaction_log.add_transaction("", amount, balance)
  end

  def print_statement
    @statement.display(transaction_log)
  end

end
