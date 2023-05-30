class Animal
  def initialize(name)
    @name = name
  end

  def speak
    puts sound
  end

  def sound
    "#{@name} says "
  end
end

class Cow < Animal
  def sound
    super + "moooooooooooo!"
  end
end

daisy = Cow.new("Daisy")
daisy.speak

# What does this code output and why?

=begin
On line 22, the `speak` method is invoked on the `daisy` object, outputting the
string "Daisy says moooooooooooo!". The `#speak` method is defined within the
`Animal` class, and passes the `#sound` method as an argument into `puts`.
`#speak` is available to `Cow` objects due to class inheritance; the `Cow` class
subclasses from `Animal`. A `#sound` method is defined within `Cow`, overriding
the `#sound` method defined within `Animal`. The `Cow#sound` method invokes
`super`, telling Ruby to search up the method lookup path for a method with the
same name, and invoke it. `Cow#sound` takes the return value of `super` and
concatenates it with the string `"moooooooooooo!"`, resulting in what is being
output to the screen.
=end
