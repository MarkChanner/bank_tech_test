require 'statement'

describe Statement do

  describe '#display' do
    it 'should display date, credit, debit, and balance headings' do
      expect(subject.display).to eq 'date || credit || debit || balance'
    end
  end

end
