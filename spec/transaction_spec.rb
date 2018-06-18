require 'transaction'

describe Transaction do
  let(:transaction) { Transaction.new() }

  it 'should return a date' do
    time = Time.new
    expect(subject.date).to eq time.strftime("%d/%m/%Y")
  end

end
