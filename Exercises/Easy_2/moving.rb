# Moving

# You have the following classes... You need to modify the code so that this
# works:

=begin
Notes:

All classes respond to a method `walk`
Possible concept being used here: duck typing
None of the classes inherit from another
- having the classes inherit from a superclass doesn't make sense with the
  exception of the cheetah and cat

Two possible solutions come to mind, we can either have the classes inherit from
a superclass `Mammal`, or we could define a module `Walkable` that we can mix in
to the classes.

Module might make more sense as not all mammals have the ability to walk
=end

module Walkable
  def walk
    puts "#{name} #{gait} forward"
  end
end

class Person
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

mike = Person.new("Mike")
mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
flash.walk
# => "Flash runs forward"