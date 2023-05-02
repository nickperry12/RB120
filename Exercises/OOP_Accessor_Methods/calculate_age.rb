# Calculated Age

# Using the following code, multiply @age by 2 upon assignment, then multiply
# @age by 2 again when @age is returned by the getter method.

=begin
Upon assignment, we want to multiply the assigned age by 2. We'll need to create
our own setter method for this. 

We then want to multiply the age by 2 once again within our getter method for
when `age` is called on the object. 

class Person
  setter method=(var)
    @var = var * 2
  end

  getter method
    @age * 2
  end
end

** Side note

We can also refactor this to have a `double` method that will double the
argument being passed in. This will help us DRY up our code, and will allow us
to perform these calculations anywhere we want. 
=end
class Person
  def age=(age)
    @age = double(age)
  end

  def age
    double(@age)
  end

  private

  def double(n)
    n * 2
  end
end

person1 = Person.new
person1.age = 20
puts person1.age # => 80