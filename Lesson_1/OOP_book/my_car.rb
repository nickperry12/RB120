module FourWheelDrive
  def enable_4WD
    puts "Four Wheel Drive is now on!"
  end
end

class Vehicle
  attr_accessor :year, :model, :color, :speed, :engine_state
  attr_reader :year, :model, :color, :speed, :engine_state

  @@number_of_vehicles = 0

  def initialize(y, c, m)
    self.year = y
    self.color = c
    self.model = m
    self.speed = 0
    self.engine_state = 'on'
    @@number_of_vehicles += 1
  end

  def self.number_of_vehicles
    puts "There are #{@@number_of_vehicles} vehicles."
  end

  def self.gas_mileage(kms, litres)
    puts "You are currently getting #{kms/litres} kms per litre."
  end

  def speed_up(s)
    self.speed += s
    puts "You step on the gas! Your speed is now #{self.speed} km/h!"
  end

  def slow_down(s)
    self.speed -= s
    puts "You hit the brakes! Your speed is now #{self.speed} km/h!"
  end

  def shut_off
    self.engine_state = 'off'
    "The engine is now off!"
  end

  def turn_on
    self.engine_state = 'on'
    "The engine is now on!"
  end

  def spray_paint(color)
    self.color = color
    puts "Your vehicle color is now #{color}!"
  end

  def vehicle_info
    "You are driving a #{color} #{year} #{model}."
  end

  def age
    puts "Your vehicle is #{vehicle_age} years old."
  end
  
  private

  def vehicle_age
    Time.now.year - self.year.to_i
  end
end

class MyTruck < Vehicle
  VIN_NUMBER = 0012314

  include FourWheelDrive
end

class MyCar < Vehicle
  VIN = 00001234
end

nicks_truck = MyTruck.new('2017', 'Charcoal', 'Dodge Ram')
nicks_truck.spray_paint("Black")
nicks_truck.speed_up(60)
nicks_truck.slow_down(40)
MyTruck.gas_mileage(400, 50)
puts nicks_truck.vehicle_info
Vehicle.number_of_vehicles
nicks_truck.enable_4WD
car = Vehicle.new('2005', 'Silver', 'Honda Civic')
nicks_truck.age