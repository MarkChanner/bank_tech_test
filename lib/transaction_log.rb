class TransactionLog

  attr_reader :transactions

  def initialize(transaction_class = Transaction)
    @transaction_class = transaction_class
    @transactions = []
  end

  def add_transaction(credit, debit, balance)
    transactions.push(@transaction_class.new(credit, debit, balance))
  end

end
