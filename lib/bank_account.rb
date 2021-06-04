# frozen_string_literal: true

require_relative 'transaction'
require_relative 'printer'

class BankAccount
  attr_reader :balance, :transactions, :overdraft_limit

  DEFAULT_BALANCE = 0
  ZERO_BALANCE = 0

  def initialize(transaction = Transaction, printer = Printer.new)
    @balance = DEFAULT_BALANCE
    @zero_balance = ZERO_BALANCE
    @transaction = transaction
    @transactions = []
    @printer = printer
  end

  def deposit(amount)
    @balance += amount
    create_transaction(amount, 0, @balance)
  end

  def withdraw(amount)
    raise 'Insufficient funds' if @balance - amount < @zero_balance

    @balance -= amount
    create_transaction(0, amount, @balance)
  end

  def print_statement
    @printer.print(@transactions)
  end

  def create_transaction(amount, balance, date)
    transaction = @transaction.new(amount, balance, date)
    @transactions << transaction
  end
end
