# Question 6

# What is the default return value of to_s when invoked on an object? Where
# could you go to find out if you want to be sure?

# By default, calling `to_s` on an object will return the object's class and
# an encoding of the object id.

# This information can be found in either the Ruby docs, or within the Launch
# School OOP book.

class Person
  attr_reader :name, :age, :occupation

  def initialize(name, age, occupation)
      @name = name
      @age = age
      @occupation = occupation
  end
end

nick = Person.new("Nick", 33, "Retail")
puts nick # => #<Person:0x00007f751b12a150>