
require 'CSV'
require 'pry'

require_relative "bank_transactions"
require_relative "bank_accounts"
require_relative "methods"

include RunMethods



#prep bank transactions
transactions = [] #array of banktransaction items

load_transactions_from_csv('bank_data.csv', transactions) #creates transactions array



#prep bank accounts
bank_accounts = [] #array of bankaccount items

load_accounts_from_csv('balances.csv', bank_accounts)


#separate transactions by bank_account
bank_transactions = separate_transactions_by_bank_account(bank_accounts, transactions)

output(bank_transactions) #call bank account summary
