class Statement

  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def add_transaction(credit, debit, balance)
    transactions.push(Transaction.new(credit, debit, balance))
  end

  def display
    result = "date || credit || debit || balance"
    @transactions.reverse.each do |t|
      result += "\n"
      result += t.display
    end
    result
  end

end
