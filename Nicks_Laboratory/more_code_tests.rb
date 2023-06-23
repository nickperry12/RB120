# # closure - block, proc, lambda
# #   - chunk of code "unnamed" passed around

# my_lambda = lambda {|s| s.to_s}
# p my_lambda.class

# How is closure different from a method
# 1. binding - greater scope. has access to anything defined before it.
# 2. pass around closure without invoking
# 3. lenient arity vs strict arity

#name = "Matic"

# def name
#  @name = "Amy"
# end

# def name=(name)
#   @name = name
# end

# name()

my_proc = proc {puts self.name = "Benji"}

# self.name = "Dylan"

# @name = name



p my_proc.call

p @name

# hash = {one: 1, two: 2, three: 3}

# hash_proc = proc { p hash[:four]}

# hash[:four] = 4

# hash_proc.call

# my_method(name())



# ARRAY = [1, 2, 3]

# def abc
#   a = 3
# end

# def xyz(collection)
#   collection.map { |x| yield x }
# end

# xyz(ARRAY) do
#   # block body
# end

# # Which of the following names is part of the binding for the block body on line 34?

# ARRAY
# abc
# # collection
# # a 
# xyz


Terminology Testing

Test Suite - all of the tests used for testing.
Test - can have many assertions
Assertions - asserting that a verification returns true.

Test Suited


assertion-style

expectation-style

SEAT Approach
S-Setup - sets up necessary objects
E- Execute - execute code against obj
A- Assertion - assert execution did what it was supposed to
T- Tear Down - clean up lingering artifacts