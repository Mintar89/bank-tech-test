# frozen_string_literal: true

class Printer
  def print(transactions)
    puts 'date || credit || debit || balance'
    transactions.reverse.each do |transaction|
      puts "#{transaction.date} || #{'%.2f' % transaction.credit} || #{'%.2f' % transaction.debit} || #{'%.2f' % transaction.current_balance}"
    end
  end
end
