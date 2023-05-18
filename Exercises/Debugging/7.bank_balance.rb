# Bank Balance

# We created a simple BankAccount class with overdraft protection, that does not
# allow a withdrawal greater than the amount of the current balance. We wrote
# some example code to test our program. However, we are surprised by what we
# see when we test its behavior. Why are we seeing this unexpected output? Make
# changes to the code so that we see the appropriate behavior.

class BankAccount
  attr_reader :balance

  def initialize(account_number, client)
    @account_number = account_number
    @client = client
    @balance = 0
  end

  def deposit(amount)
    if amount > 0
      self.balance += amount
      "$#{amount} deposited. Total balance is $#{balance}."
    else
      "Invalid. Enter a positive amount."
    end
  end

  def withdraw(amount)
    if (balance - amount) > 0 && valid_transaction?(balance - amount)
      balance -= amount
      "$#{amount} withdrawn. Total balance is $#{balance}."
    else
      "Invalid. Enter positive amount less than or equal to current balance ($#{balance})."
    end
  end

  def balance=(new_balance)
    @balance = new_balance
  end

  def valid_transaction?(new_balance)
    new_balance >= 0
  end
end

# Example

account = BankAccount.new('5538898', 'Genevieve')

                          # Expected output:
p account.balance         # => 0
p account.deposit(50)     # => $50 deposited. Total balance is $50.
p account.balance         # => 50
p account.withdraw(80)    # => Invalid. Enter positive amount less than or equal to current balance ($50).
                          # Actual output: $80 withdrawn. Total balance is $50.
p account.balance         # => 50

=begin
When we invoke the `BankAccount#withdraw` method, it returns a string stating
the amount withdrawn and the balance left. However, because the amount being
withdrawn exceeds the account balance, an error message should be returned
instead.

When we look at the `BankAccount#withdraw` method definition, we can see that
there is an issue with the conditional check `if amount > 0`. If any number 
passed into the method is greater than 0, the amount will be subtracted from
`balance`. This isn't what we want; what we need instead is it to check if the
amount being withdrawn is greater than the amount referenced by `balance`. Once
the chagne to the conditional is changed to reflect that, the code works as it
is intended to.
=end