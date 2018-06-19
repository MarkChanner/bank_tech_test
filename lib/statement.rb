class Statement

  def display(transaction_log)
    result = "date || credit || debit || balance"
    transaction_log.transactions.reverse.each do |transaction|
      result += "\n"
      result += transaction.show
    end
    result
  end
end
