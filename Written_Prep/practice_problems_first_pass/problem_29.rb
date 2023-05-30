# When does accidental method overriding occur, and why? Give an example.

=begin
Accidental method overriding occurs when we define a method within a class with
the same name as another method further up the method look up path. This can
cause unexpected behaviors in our code; we may call the overriden method
expecting the behaviors of the original, but instead get the new functionality
instead. An example would be if we defined our own `freeze` method, overriding
the `Object#freeze` method that is defined within the built in Ruby class
`Object`:

```ruby
class Water
  def freeze
    "It's so cold, the water has frozen!"
  end
end

water = Water.new
water.freeze
```

In this example, the `Water#freeze` method overrides the `Object#freeze` method,
and if for whatever reason we wanted to call the `freeze` method on the `water`
object to prevent any further modifications being made to it, we would instead
have a method that returns a string with the value `"It's so cold, the water has
frozen!"`, leading to bugs within our program. For this reason, it's a good idea
to familiarize ones self with some of the common `Object` methods, so we don't
accidentally define a method that has the same name.
=end