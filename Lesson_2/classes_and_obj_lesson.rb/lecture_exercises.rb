#1. Given the below usage of the `Person ` class, code the class definition.

=begin
bob = Person.new('bob')
bob.name                  # => 'bob'
bob.name = 'Robert'
bob.name                  # => 'Robert'
=end

# class Person
#   attr_accessor :name

#   def initialize(n)
#     @name = n
#   end
# end

# bob = Person.new('bob')
# p bob.name                  # => 'bob'
# bob.name = 'Robert'
# p bob.name                  # => 'Robert'

# 2. Modify the class definition from above to facilitate the following methods.
#    Note that there is no `name= ` setter method now.

=begin
bob = Person.new('Robert')
bob.name                  # => 'Robert'
bob.first_name            # => 'Robert'
bob.last_name             # => ''
bob.last_name = 'Smith'
bob.name                  # => 'Robert Smith'
=end

# class Person
#   attr_accessor :first_name, :last_name

#   def initialize(n)
#     split_name = n.split
#     @first_name = split_name[0]
#     @last_name = split_name.size > 1 ? split_name[-1] : ''
#   end

#   def name
#     "#{first_name} #{last_name}".strip
#   end
# end

# bob = Person.new('Robert')
# p bob.name                  # => 'Robert'
# p bob.first_name            # => 'Robert'
# p bob.last_name             # => ''
# p bob.last_name = 'Smith'
# p bob.name    


# 3. Now create a smart `name= ` method that can take just a first name or a
#    full name, and knows how to set the `first_name` and `last_name`
#    appropriately.

# class Person
#   attr_accessor :first_name, :last_name

#   def initialize(n)
#     parse_full_name(n)
#   end

#   def name
#     "#{first_name} #{last_name}".strip
#   end

#   def name=(n)
#     parse_full_name(n)
#   end

#   private

#   def parse_full_name(n)
#     split_name = n.split
#     @first_name = split_name[0]
#     @last_name = split_name.size > 1 ? split_name[-1] : ''
#   end
# end

# bob = Person.new('Robert')
# p bob.name                  # => 'Robert'
# p bob.first_name            # => 'Robert'
# p bob.last_name             # => ''
# bob.last_name = 'Smith'
# p bob.name                  # => 'Robert Smith'

# bob.name = "John Adams"
# p bob.first_name            # => 'John'
# p bob.last_name             # => 'Adams'

# 4. Using the class definition from step #3, let's create a few more people --
#    that is, Person objects.

class Person
  attr_accessor :first_name, :last_name

  def initialize(n)
    parse_full_name(n)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(n)
    parse_full_name(n)
  end

  def to_s
    name
  end

  private

  def parse_full_name(n)
    split_name = n.split
    @first_name = split_name[0]
    @last_name = split_name.size > 1 ? split_name[-1] : ''
  end
end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

# If we're trying to determine whether the two objects contain the same name,
# how can we compare the two objects?

p bob.name == rob.name
bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"