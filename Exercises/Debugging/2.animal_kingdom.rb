# Animal Kingdom

# The code below raises an exception. Examine the error message and alter the
# code so that it runs without error.

class Animal
  def initialize(diet, superpower)
    @diet = diet
    @superpower = superpower
  end

  def move
    puts "I'm moving!"
  end

  def superpower
    puts "I can #{@superpower}!"
  end
end

class Fish < Animal
  def move
    puts "I'm swimming!"
  end
end

class Bird < Animal
end

class FlightlessBird < Bird
  def initialize(diet, superpower)
    super
  end

  def move
    puts "I'm running!"
  end
end

class SongBird < Bird
  def initialize(diet, superpower, song)
    super(diet, superpower)
    @song = song
  end

  def move
    puts "I'm flying!"
  end
end

# Examples

unicornfish = Fish.new(:herbivore, 'breathe underwater')
penguin = FlightlessBird.new(:carnivore, 'drink sea water')
robin = SongBird.new(:omnivore, 'sing', 'chirp chirrr chirp chirp chirrrr')

# My Solution

=begin
The problem is how we've defined the `initialize` method within the `SongBird`
class. Within the method definition, we're calling `super` to inherit the
behaviors from the `Animal` superclass. However, we're not passing in any
arguments, so Ruby by default will pass in all arguments that have been passed
into the `initialize` method into `super`. This throws an error because the
`initialize` method defined within the `Animal` superclass only accepts two
arguments. 

To fix this, we can explicitly state which arguments are to be passed into
`super`, and then initialize the third argument into an instance variable
afterwards.

Futher Exploration:
Is the FlightlessBird#initialize method necessary? Why or why not?

No, the method is not necessary. It's not necessary because no changes are
being made to the method which would neccessitate overriding the method. By
having this method defined within the `FlightlessBird` class for it to only
call `super` within the method, makes our code reptitive. We have defined a
method that is already being inherited, and it has the same functionality.
=end