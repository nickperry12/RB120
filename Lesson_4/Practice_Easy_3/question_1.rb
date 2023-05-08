# Question 1

# If we have this code, what happens if we have the following cases:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# case 1

hello = Hello.new
hello.hi

# The `Hello` class inherits from the superclass `Greeting`. `Hello` has an
# instance method `hi`, and within it's definition, it calls the instance method
# `greet` with the string "Hello" passed in. The `greet` method is defined
# within the `Greeting` class.

# On line 25 a new object of the `Hello` class is instantiated to the local
# variable `hello`. The instance is method is then invoked on the object
# `hello`. This will output "Hello".

# case 2

hello = Hello.new
hello.bye

# This will throw an error (`NoMethodError`) because there is no `bye` method
# defined within the `Hello` class or the `Greeting` class. `bye` is defined
# within the `Goodbye` class, which inherits from the `Greeting` class.

# case 3

hello = Hello.new
hello.greet

# This will throw an error as there are no arguments being passed into the
# `greet` method. The `Hello` class inherits from the `Greeting` class, so the
# method is available to be called on an object of the `Hello` class, however an
# argument must be passed in.

# case 4

hello = Hello.new
hello.greet("Goodbye")

# This will output "Goodbye"

# case 5

Hello.hi

# This will throw a `NoMethodError`. Here the `hi` method is being called
# directly onto the `Hello` class. However, there is only an instance method
# `hi` availabe, not a class method. When a method is called directly onto the
# class, it's attempting to call a class method.