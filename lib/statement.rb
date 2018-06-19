class Statement

  def display(transaction_log)
    result = "date || credit || debit || balance"
    transaction_log.transactions.reverse.each do |t|
      result += "\n"
      result += t.display
    end
    result
  end
end
