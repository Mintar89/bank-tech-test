# frozen_string_literal: true

require 'bank_account'

describe BankAccount do
  context '#balance' do
    it 'returns a default balance of zero' do
      expect(subject.balance).to eq 0
    end
  end

end
