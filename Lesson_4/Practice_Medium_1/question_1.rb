# Question 1

# Ben asked Alyssa to code review the following code:

class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

account = BankAccount.new(500)

p account.positive_balance?

=begin
Alyssa glanced over the code quickly and said - "It looks fine, except that you
forgot to put the @ before balance when you refer to the balance instance
variable in the body of the positive_balance? method."

"Not so fast", Ben replied. "What I'm doing here is valid - I'm not missing an
@!"

Who is right, Ben or Alyssa, and why?

-------- ANSWER --------

Both are technically right. Alyssa is right because if we wanted to access the
`@balance` instance variable directly we would need to prefix `balance` with an
`@` in order to do so.

However, this is not what Ben is trying to do. Ben is using the `balance` getter
method which we have access to due to the `attr_reader` method at the top of the
class definition. The `attr_reader` has `:reader` passed in as an argument,
creating a getter method for that symbol. 

So, within his method, we're actually using the return value of the `balance`
getter method, which is returning the `@balance` instance variable and the value
it is referencing.



-------- LS ANSWER --------

Ben is right because of the fact that he added an attr_reader for the balance
instance variable. This means that Ruby will automatically create a method
called balance that returns the value of the @balance instance variable. The
body of the positive_balance? method will evaluate to calling the balance method
of the class, which will return the value of the @balance instance variable. If
Ben had omitted the attr_reader (or had used an attr_writer rather than a reader
or accessor) then Alyssa would be right.

=end