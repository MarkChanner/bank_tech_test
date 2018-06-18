class Statement

  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def add_transaction(credit, debit, balance)
    transactions.push(Transaction.new(credit, debit, balance))
  end

  def display
    'date || credit || debit || balance'
  end
end
