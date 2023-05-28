# How and why would we implement a fake operator in a custom class? Give an
# example.

=begin
We can implement a fake operator by defining and overriding the built-in methods
that Ruby provides. We would do so because it allows us to compare specific
types of data associated with our objects. For example, if we had a class
`BankAccount` that tracked the amount of money in the savings account of an
object from that class, we can redefine the fake operator `<=>` to allow us to
compare that data. We can define it like so:

```
class BankAccount
  include Comparable

  attr_reader :savings

  def initialize(savings)
    @savings = savings
  end

  def <=>(other_account)
    savings <=> other_account.savings
  end
end

nicks_account = BankAccount.new(5000)
daves_account = BankAccount.new(7000)

nicks_account > daves_account # => false
nicks_account < daves_account # => true
```

By mixing in the `Comparable` module, we now have access to the comparison
methods contained within it. We have also defined our own `<=>` method, and
within it we are telling the `<=>` method to compare the values stored in the
`savings` instance variable.
=end

class BankAccount
  include Comparable

  attr_reader :savings

  def initialize(savings)
    @savings = savings
  end

  def <=>(other_account)
    savings <=> other_account.savings
  end
end

nicks_account = BankAccount.new(5000)
daves_account = BankAccount.new(7000)

p nicks_account < daves_account # => true
p nicks_account > daves_account # => false