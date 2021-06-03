# frozen_string_literal: true

require './lib/transaction'

describe Transaction do
  let(:transaction) { described_class.new(500, 0, 500) }

  describe '#initialize' do
    it 'stores information about each transaction' do
      expect(transaction.current_balance).to eq 500
    end
  end
end
