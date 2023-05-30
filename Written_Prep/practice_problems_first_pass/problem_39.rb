class Thing
end

class AnotherThing < Thing
end

class SomethingElse < AnotherThing
end


# Describe the inheritance structure in the code above, and identify all the
# superclasses.

=begin
In this code snippet we have 3 classes, `Thing`, `AnotherThing` and
`SomethingElse`. `AnotherThing` subclasses from `Thing`, inheriting the states
and behaviors defined within `Thing`. `SomethingElse` inherits from the
`AnotherThing` class, inheriting states and behaviors from `AnotherThing` and
`Thing`. `Thing` is a superclass for `AnotherThing`, and `AnotherThing` is a
superclass for `SomethingElse`. 
=end
