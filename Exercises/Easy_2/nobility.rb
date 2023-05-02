# Nobility

module Walkable
  def walk
    puts "#{full_name} #{gait} forward"
  end
end

class Animal
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def full_name
    name
  end
end

class Person < Animal
  private

  def gait
    "strolls"
  end
end

class Noble < Animal
  attr_reader :title
  
  def initialize(name, title)
    @title = title
    super(name)
  end

  def full_name
    "#{title} #{name}"
  end

  private

  def gait
    "struts"
  end
end

class Cat < Animal
  private

  def gait
    "saunters"
  end
end

class Cheetah
  private

  def gait
    "runs"
  end
end

# Now that we have a Walkable module, we are given a new challenge. Apparently
# some of our users are nobility, and the regular way of walking simply isn't
# good enough. Nobility need to strut.

# We need a new class Noble that shows the title and name when walk is called:

byron = Noble.new("Byron", "Lord")
byron.walk
# => "Lord Byron struts forward"

# We must have access to both name and title because they are needed for other
# purposes that we aren't showing here.

p byron.name
# => "Byron"
p byron.title
# => "Lord"


# Solution

=begin
We can create a `full_name` instance method within a super class, that returns
the name of that object. All classes can then inherit from the superclass.
Within the `Noble` class, we can override the `full_name` method, and within it
we can concatenate the `@title` and `@name` instance variables together and
returns the result. We then modify the `walk` method within module to
interpolate the return value of the `full_name` method.

"This polymorphic solution seems to be the best. The call to full_name clearly
describes its purpose. We keep the implementation of walk sectioned off to the
Walkable module, and full_name makes sense to be more tightly bound to the
Animal class and related subclasses. Furthermore, inheritance keeps our code
DRY."
=end