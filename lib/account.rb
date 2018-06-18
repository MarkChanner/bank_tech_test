class Account
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def make_deposit(amount)
    @balance += amount
  end

  def make_withdrawal(amount)
    raise 'Requested amount exceeds available funds' if @balance - amount < 0
    @balance -= amount
  end

end
