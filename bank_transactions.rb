class BankTransaction

  attr_reader :date, :amount, :description, :account

  def initialize(date, amount, description, account)
    @date = date
    @amount = amount
    @description = description
    @account = account
  end

  def format_currency(currency)
    sprintf('%.2f', currency)
  end

  def debit_or_credit #rename
    if amount<0
      "DEBIT"
    elsif amount >0
      "CREDIT"
    end
  end

  def summary
    "$#{format_currency(amount.abs)} #{debit_or_credit} #{date} - #{description}"
  end

end


