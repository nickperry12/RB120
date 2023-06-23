=begin
This exercise asks you to create a class design for a fake "Zoo Animal Categorization Application."

A Zoo Animal Categorization Application has information about the animals that live in a zoo.

Zebras, hawks, tigers, koalas, and parrots are the animals that can be found in the zoo, and each has an animal id, weight, diet, and body temperature.
=> Create objects for each animal that subclasses from `Animal
=> Need states for :id, :weight, :diet, :body_temperature

None of the values of an animal should be accessible by the public. Likewise, no values should be altered after an animal is created.
=> use a private method call

The application tracks the total number of animals that have been created. This number is used to assign a unique animal id when a new animal is created.
=> When an animal is instantiated, must increment a class variable by 1

When an animal is created, its weight will be determined by a #calc_weight (make private)
method. #calc_weight cannot be accessed from outside the class. It will take two
arguments, an upper and lower weight range appropriate for the particular
species. The method will randomly determine each animal's weight within the
ranges described below, inclusive of the upper and lower weight limits.

Zebras weigh between 770-990 pounds
Tigers weigh between 200-680 pounds
Koalas weigh between 10-30 pounds
Hawks weigh between 12-15 pounds
Parrots weigh between 1-3 pounds
All animals are either herbivores or carnivores.

Zebras, koalas, and parrots are herbivores, and their diet consists of vegetation.
Tigers and hawks are carnivores, and their diet consists of meat.
All animals in the zoo will have a body temperature of 'warm-blooded'.
=> use modules for diets

Parrots and hawks can fly, therefore, they should have access to a #fly method.
=> create flyable module

Zebras and parrots are social creatures and should have access to a #social method.
=> create sociable

Tigers and hawks are apex predators and can hunt. Therefore, they should have access to a #hunt method that accepts one argument, prey.
=> huntable module

If you pass an animal to the #puts method, it should print information about the animal in this format:

define our own to_s method that outputs the following:

========================
species: Zebra
animal id: 1
weight: 860
diet: vegetation
body temp: warm-blooded
========================

Create a set of classes based on the description of the zoo animal
categorization application. Your classes should show any inheritance
relationships, module inclusions, and methods necessary to meet the
requirements.

This exercise is about designing class relationships and how you organize your
classes, behaviors, and state. Your methods should provide the details needed to
fulfill the requirements. In some cases, you may be able to omit the method body
entirely. However, please don't include any functionality that we don't describe
above.
=end

module Herbivore
  def diet
    "vegetation"
  end
end

module Carnivore
  def diet
    "meat"
  end
end

module Flyable
  def fly; end
end

module Huntable
  def prey; end
end

module Sociable
  def social; end
end

class ZooAnimals
  @@number_of_animals = 0

  def initialize
    @id = self.class.add_animal
    @weight = calc_weight
    @body_temperature = "warm blooded"
  end

  def self.add_animal
    @@number_of_animals += 1
  end

  def to_s
    "========================\nspecies: #{self.class}\nanimal id: #{id}\nweight: #{weight}\nbody temp: #{body_temperature}\n========================"
  end

  private

  attr_reader :diet, :body_temperature, :weight, :id

  def calc_weight(min_weight, max_weight)
    rand(min_weight..max_weight)
  end
end

class Zebra < ZooAnimals
  include Herbivore
  include Sociable

  private

  def calc_weight
    super(770, 990)
  end
end

class Hawk < ZooAnimals
  include Carnivore
  include Flyable
  include Huntable

  private

  def calc_weight
    super(12, 15)
  end
end

class Tiger < ZooAnimals
  include Carnivore
  include Huntable

  private

  def calc_weight
    super(200, 680)
  end
end

class Koala < ZooAnimals
  include Herbivore

  private

  def calc_weight
    super(10, 30)
  end
end

class Parrot < ZooAnimals
  include Herbivore
  include Sociable

  private

  def calc_weight
    super(1, 3)
  end
end

zebra = Zebra.new
parrot = Parrot.new
hawk = Hawk.new

[zebra, parrot, hawk].each { |animal| puts animal }