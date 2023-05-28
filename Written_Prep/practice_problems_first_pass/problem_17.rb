# Give an example of when it would make sense to manually write a custom getter
# method vs. using `attr_reader`.

=begin
An example of when it would make sense to manually write a custom getter method
would be when we're working with sensitive data, and we don't want all of it
exposed to the public interface. For example, we have an app that you can make
purchases through. Within this app, you're able to create a user profile and
store your credit card information so you don't have to enter it every time.
However, you don't want the full credit card number to appear in your user
profile, and instead only want the last 4 digits to show to confirm that it is
indeed your card that's stored. For this we could write a custom `getter` method

```
class UserProfile
  def initialize(name, credit_card_number)
    @name = name
    @credit_card_number = credit_card_number
  end

  def credit_card_number
    "xxxx-xxxx-xxxx" + @credit_card_number.split('-').last
  end
end
```

Using this custom `getter` method, only the last 4 digits will be exposed as
opposed to the entire card number.
=end