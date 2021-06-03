# frozen_string_literal: true

require 'bank_account'

describe BankAccount do
  let(:account) { described_class.new }
  let(:date) { Time.now.strftime('%d/%m/%Y') }

  describe '#balance' do
    it 'returns a default balance of zero' do
      expect(account.balance).to eq BankAccount::DEFAULT_BALANCE
    end
  end

  describe '#deposit' do
    it 'increases the balance by the deposit amount' do
      account.deposit(500)
      expect(account.balance).to eq 500
    end

    it 'records transaction' do
      account.deposit(1000)
      expect(account.transactions.first.date).to eq date
      expect(account.transactions.first.credit).to eq 1000
      expect(account.transactions.first.debit).to eq 0
      expect(account.transactions.first.current_balance).to eq 1000
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
