# Question 4

# If we have a class AngryCat how do we create a new instance of this class?

# The AngryCat class might look something like this:

class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end

# To create a new instance of this class, we can use a variable name (can name
# it anything, we'll use `mad_cat`), and then initialize that variable to
# `AngryCat.new`. We're calling the `new` method on the class `AngryCat`, which
# will instantiate a new object of that class and assign it to the variable
# `mad_cat`. This can also be done with initialize `AngryCat.new` to a variable.

mad_cat = AngryCat.new