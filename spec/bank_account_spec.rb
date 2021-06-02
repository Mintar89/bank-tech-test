# frozen_string_literal: true

require 'bank_account'

describe BankAccount do
  let(:account) { described_class.new }

  describe '#balance' do
    it 'returns a default balance of zero' do
      expect(account.balance).to eq BankAccount::DEFAULT_BALANCE
    end
  end

  describe '#deposit' do
    it 'increases the balance by the deposit amount' do
      expect(account.deposit(500)).to eq 500
    end
  end

  describe '#withdraw' do
    it 'reduces the balance by the specified amount' do
      account.deposit(2000)
      account.withdraw(500)
      expect(account.balance).to eq 1500
    end
  end


end
