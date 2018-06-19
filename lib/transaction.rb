class Transaction

  attr_reader :date, :credit, :debit, :new_balance

  def initialize(credit, debit, new_balance)
    time = Time.new
    @date = time.strftime("%d/%m/%Y")
    @credit = credit
    @debit = debit
    @new_balance = new_balance
  end

  def display
    if credit == ""
      return date + " || || %0.2f || %0.2f" % [debit.to_f, new_balance.to_f]
    elsif debit == ""
      return date + " || %0.2f || || %0.2f" % [credit.to_f, new_balance.to_f]
    else
      raise 'Either credit or debit should be an empty string'
    end

  end

end
