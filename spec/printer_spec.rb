# frozen_string_literal: true

require './lib/printer'

describe Printer do
  subject(:printer) { described_class.new }

  let(:transaction) do
    double(:transaction, date: '10/01/2012', credit: '0.00', debit: '2000.00', current_balance: '2000.00')
  end

  describe '#print' do
    it 'prints the bank statement' do
      expected_statement = "date || credit || debit || balance\n"\
                           "10/01/2012 || 0.00 || 2000.00 || 2000.00\n"
      bank_statement = [transaction]
      expect { printer.print(bank_statement) }.to output(expected_statement).to_stdout
    end
  end
end
