# Question 1

# Which of the following are objects in Ruby? If they are objects, how can you
# find out what class they belong to?

p true.class                        # object => `TrueClasss` class
p "hello".class                     # object => `String` class
p [1, 2, 3, "happy days"].class     # object => `Array` class
p 142.class                         # object => Integer class

# To find out which class these belong to, we can call the `class` method, which
# will return the class each object belongs to. All of the above are objects.


# LS Answer:

# All of them are objects! All values in Ruby are an object, so you never need
# to ask yourself "is this value an object?" because the answer every time will
# be "Yes!".

# You can find out what class an object belongs to in Ruby by asking the object
# what its class is by calling the method class on the object, as you can see
# below: