class Person
  TITLES = ['Mr', 'Mrs', 'Ms', 'Dr']

  @@total_people = 0

  def initialize(name)
    @name = name
  end

  def age
    @age
  end
end

# What are the scopes of each of the different variables in the above code?

=begin
`TITLES` is a constant variable and has lexical scope. `@@total_people` is a
class variable and is scoped at the class level. `@name` and `@age` are both
instance variables and are scoped at the instance/object level.
=end
