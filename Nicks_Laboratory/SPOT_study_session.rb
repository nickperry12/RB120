=begin

Welcome to Today's RB120/129 SPOT Session
We'll get started at :00

Itinerary

- Expectations
- Introductions
- Request for Input: topics to discuss
- Practice Problems
- Final Questions & Farewells — :55

Expectations

- I am not a TA, I’m just a student like you
- the goal for a SPOT session is not for the SPOT Lead to lecture or teach
- instead the goal is for attendees to learn from each other
- you can say “pass”

Introductions

- name
- location in world
- location in course (RB120 or Written Prep or Interview Prep)
- topics you want covered today
- name of the next person

Nick
- collaborator objects

Trish
- written prep
- practice verbalizing

Cruz
- written prep

### Concept Questions

- Encapsulation
- Polymorphism
- Method Access Control
- Modules - what are the different uses?
- Kinds of variables: what is the scope of each type?
- Self - what does it refer to?
- Collaborator Objects

- definition
- example of how to implement
- benefits

=end

# class Person
#   attr_reader :name
#   attr_writer :name

#   def initialize(name)
#     @name = name
#   end
# end

# bob = Person.new("Bob")

# p bob.name = "Nick"
# p bob.name

# module Behaviors
#   def bark 
#     'bark'
#   end 
# end 

# class Animal
# end 

# class Dog < Animal 
# include Behaviors 
# end 

# dog = Dog.new
# puts dog.bark

# class Vehicle
#   def initialize(color, model, fuel_efficiency)
#     @color = color
#     @model = model
#     @fuel_efficiency = fuel_efficiency
#   end
# end

# class FuelCalculator
# end

# fuel_efficiency = FuelCalculator.new
# vehicle = Vehicle.new("red", "tesla", fuel_efficiency)


# class Jedi
#   attr_accessor :name
#   attr_reader :weapon

#   def initialize(name, weapon)
#     @name = name
#     @weapon = weapon
#   end
# end

# class Lightsaber
#   def swing
#     "swings lightsaber"
#   end
# end

# saber = Lightsaber.new
# nick = Jedi.new("Nick", saber)

# puts nick.weapon.swing

# TIRES = 18

# module Automotive
#   # TIRES = 6

#   class Vehicle
#     # TIRES = 4
#   end

#   class Car < Vehicle
#     def num_of_tires
#       TIRES
#     end
#   end
# end

# car = Automotive::Car.new
# p car.num_of_tires

=begin
1. lexically
2. inheritance chain
3. top-level / main
=end

module Describable
  def describe_shape
    "I am a #{self.class} and have #{self.class::SIDES} sides."
  end
end

class Shape
  include Describable

  def self.sides
    self::SIDES
  end
  
  def sides
    self.class::SIDES
  end
end

class Triangle < Shape
end

class Quadrilateral < Shape
  SIDES = 4
end

class Square < Quadrilateral

end

p Square.sides # 4
p Square.new.sides
p Square.new.describe_shape 