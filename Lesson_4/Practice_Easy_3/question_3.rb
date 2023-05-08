# Question 3

# When objects are created they are a separate realization of a particular
# class.

# Given the class below, how do we create two different instances of this class
# with separate names and ages?

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

# We can instantiate two objects of this class with different names and ages by
# passing in arguments with different values when instantiating them. The code
# would look like this:

angry_mittens = AngryCat.new(4, "Mittens")
angry_prinkles = AngryCat.new(8, "Prinkles")

angry_mittens.name
angry_mittens.age
angry_prinkles.name
angry_prinkles.age