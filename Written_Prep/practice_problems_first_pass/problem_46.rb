class Character
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    "#{name} is speaking."
  end
end

class Knight < Character
  def name
    "Sir " + super
  end
end

sir_gallant = Knight.new("Gallant")
p sir_gallant.name 
p sir_gallant.speak 


# What is output and returned, and why? What would we need to change so that the
# last line outputs `”Sir Gallant is speaking.”`? 

=begin
Line 21 will output `"Gallant is speaking."`. The `#speak` method interpolates
the value referenced by the instance variable `@name`. To remedy this and get
the intended output, we can remove the `@` from `@name` within the `#speak`
method. This will then instead return the value of the `#name` method defined in
the `Knight` class. 

The `name` method concatenates the string `"Sir"` with the return value of a
call to `super`. The `super` keyword tells Ruby to search the method lookup path
for the class it is called in and find a method with the same name. If it finds
that method, it invokes it. In this case, `super` will find a method `#name`
within the `Character` class.

The `Character#speak` class uses string interopolation to interpolate the
`getter` method name into a string; the `getter` method will return the value
that is assigned to the `@name` instance variable, which are both made available
to the `Knight` class, as the `Knight` class subclasses from `Character`.
`super` then takes this string and returns it within the `Knight#speak` method,
and concatenates it with the string `"Sir"`, resulting in the output `"Sir
Gallant is speaking."`.
=end
