class Transaction

  attr_reader :date

  def initialize()
    time = Time.new
    @date = time.strftime("%d/%m/%Y")
  end

end
