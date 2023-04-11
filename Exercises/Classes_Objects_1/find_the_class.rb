# Find the Class

# Update the following code so that, instead of printing the
# values, each statement prints the name of the class to which it belongs.

# puts "Hello"
# puts 5
# puts [1, 2, 3]

# Expected output:

# String
# Integer
# Array

=begin

With the given code, we want to modify it that instead of outputting the objects
themselves, it outputs the class they belong to.

We can do so by calling the `#class` method on the objects, and pass the return
value in as an argument to the `puts` method.

=end

puts "Hello".class
puts 5.class
puts [1, 2, 3].class