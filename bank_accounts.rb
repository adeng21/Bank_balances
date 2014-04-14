class BankAccount

  attr_reader :account_type, :starting_balance, :transactions_array

  def initialize(account_type, starting_balance, transactions_array = [])
    @account_type = account_type
    @starting_balance = starting_balance
    @transactions_array = transactions_array
  end

  def transaction_total
    total_transactions = transactions_array.map {|trans| trans.amount}
    total_transactions.inject{|sum, n| sum + n}
  end

  def ending_balance #modify this so it doesnt start from beginning
    starting_balance + transaction_total
  end

  def summary
    string = ""
    transactions_array.each do |trans|
      string += "#{trans.summary}\n"
    end
    string
  end


end


