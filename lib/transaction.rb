# frozen_string_literal: true

class Transaction
  attr_reader :credit, :debit, :current_balance, :date

  def initialize(credit, debit, balance, date = Time.new.strftime('%d/%m/%Y'))
    @credit = credit
    @debit = debit
    @current_balance = balance
    @date = date
  end
end
