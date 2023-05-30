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
method. This will then instead return the value of the `#name` method defined
in the `Knight` class. 
=end
