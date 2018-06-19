class Account
  attr_reader :transaction_log, :statement, :balance

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
    raise 'Requested amount exceeds available funds' if insufficient_funds?(amount)
    @balance -= amount
    transaction_log.add_transaction("", amount, balance)
  end

  def print_statement
    statement.display(transaction_log)
  end

  private
  def insufficient_funds?(amount)
    balance - amount < 0
  end

end
