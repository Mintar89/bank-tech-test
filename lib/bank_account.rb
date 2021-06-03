# frozen_string_literal: true

require_relative 'transaction'

class BankAccount
  attr_reader :balance, :transactions

  DEFAULT_BALANCE = 0

  def initialize(transaction = Transaction)
    @balance = DEFAULT_BALANCE
    @transaction = transaction
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    create_transaction(amount, 0, @balance)
  end

  def withdraw(amount)
    @balance -= amount
    create_transaction(0, amount, @balance)
  end

  def create_transaction(amount, balance, date)
    transaction = @transaction.new(amount, balance, date)
    @transactions << transaction
  end
end
