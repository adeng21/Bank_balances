require 'CSV'
require 'pry'

module RunMethods

  def load_accounts_from_csv(csv, array) #break into 2 steps, open file, then iterate
    CSV.foreach(csv, headers:true) do |row|
      array << BankAccount.new(row["Account"], row["Balance"].to_f)
    end
    array
  end

  def load_transactions_from_csv(csv, array) #load info from CSV and make into array of hashes
    CSV.foreach(csv, headers: true) do |row|
    array << BankTransaction.new(row["Date"], row["Amount"].to_f, row["Description"], row["Account"])
    end
    array
  end

  def separate_transactions_by_bank_account(bank_account_array, trans_array)
    bank_account_array.each do |bank_account|
      trans_array.each do |transaction|
        if transaction.account == bank_account.account_type
          bank_account.transactions_array << transaction
        end
      end
    end
  end

  def format_currency(currency)
    sprintf('%.2f', currency)
  end

  def output(array)
    array.each do |account|

      puts "===#{account.account_type}===" #summary should be in account class, then account summary should be in transaction class
      puts "Starting Balance: $#{format_currency(account.starting_balance)}"
      puts "Ending Balance: $#{format_currency(account.ending_balance)}"
      puts
      puts account.summary
      puts
      end
  end

end
