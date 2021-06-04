# frozen_string_literal: true

require_relative 'transaction'
require_relative 'printer'

class BankAccount
  attr_reader :balance, :transactions, :overdraft_limit

  DEFAULT_BALANCE = 0
  ZERO_BALANCE = 0

  def initialize(transaction_class = Transaction, printer = Printer.new)
    @balance = DEFAULT_BALANCE
    @zero_balance = ZERO_BALANCE
    @transaction_class = transaction_class
    @transactions = []
    @printer = printer
  end

  def deposit(debit)
    @balance += debit
    create_transaction(debit, 0, @balance)
  end

  def withdraw(credit)
    raise 'Insufficient funds' if @balance - credit < @zero_balance

    @balance -= credit
    create_transaction(0, credit, @balance)
  end

  def print_statement
    @printer.print(@transactions)
  end

  def create_transaction(credit, debit, balance)
    transaction = @transaction_class.new(credit, debit, balance)
    @transactions << transaction
  end
end
