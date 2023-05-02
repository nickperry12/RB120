# Question 2

# If we have a Car class and a Truck class and we want to be able to go_fast,
# how can we add the ability for them to go_fast using the module Speed? How can
# you check if your Car or Truck can now go fast?

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed

  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed

  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

# In order to add the abbility for each class to be able to "go_fast", we can
# include the `Speed` module in each class. Alternatively, we can include the
# module in another class `Vehicle` and have both `Car` and `Truck` inherit from
# that class.

# To check if the Car or Truck can go fast, we can instantiate objects from each
# class and call the `go_fast` method on each.

my_car = Car.new
my_truck = Truck.new

my_car.go_fast
my_truck.go_fast

# LS Solution

# Same as mine