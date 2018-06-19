class TransactionLog

  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def add_transaction(credit, debit, balance)
    transactions.push(Transaction.build(credit, debit, balance))
  end

end
