# Comparing Wallets

# Consider the following broken code... Modify this code so it works. Do not
# make the amount in the wallet accessible to any method that isn't part of the
# Wallet class.

class Wallet
  include Comparable

  def initialize(amount)
    @amount = amount
  end

  def <=>(other_wallet)
    amount <=> other_wallet.amount
  end

  protected

  attr_reader :amount
end

bills_wallet = Wallet.new(500)
pennys_wallet = Wallet.new(465)
if bills_wallet > pennys_wallet
  puts 'Bill has more money than Penny'
elsif bills_wallet < pennys_wallet
  puts 'Penny has more money than Bill'
else
  puts 'Bill and Penny have the same amount of money.'
end

# Further Exploration

# This example is rather contrived and unrealistic, but this type of situation
# occurs frequently in applications. Can you think of any applications where
# protected methods would be desirable?

=begin
I think in general protected methods could be useful when you need to compare
sensitive data between two objects, but don't want that data to be available
to the public interface. An example of that would be an application where you
need to check the answers on an exam and see if they're correct. You need to be
able to acces the answers within the class and between instances of that class
but don't want the student or exam answers made available to the public
interface.
=end