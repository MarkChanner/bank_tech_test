class Account
  attr_reader :balance

  def initialize(statement)
    @statement = statement
    @balance = 0
  end

  def make_deposit(amount)
    @balance += amount
    @statement.add_transaction(amount, "", @balance)
  end

  def make_withdrawal(amount)
    raise 'Requested amount exceeds available funds' if @balance - amount < 0
    @balance -= amount
    @statement.add_transaction("", amount, @balance)
  end

  def print_statement
    @statement.display
  end

end
