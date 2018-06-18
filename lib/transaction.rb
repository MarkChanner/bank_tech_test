class Transaction

  attr_reader :date, :credit, :debit, :new_balance

  def initialize(credit, debit, new_balance)
    time = Time.new
    @date = time.strftime("%d/%m/%Y")
    @credit = credit
    @debit = debit
    @new_balance = new_balance
  end

end
