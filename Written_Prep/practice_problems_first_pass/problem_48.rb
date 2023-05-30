class Person
  def initialize(name)
    @name = name
  end
end

class Cat
  def initialize(name, owner)
    @name = name
    @owner = owner
  end
end

sara = Person.new("Sara")
fluffy = Cat.new("Fluffy", sara)


# What are the collaborator objects in the above code snippet, and what makes
# them collaborator objects?

=begin
In this code snippet, the object `sara`, which is instantiated from the `Person`
class, is the collaborator object. Collaborator objects are objects that are
stored within the state of another object. In this case, the `sara` object is
stored within the `fluffy` object's `@owner` instance variable.
=end
