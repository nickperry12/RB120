class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def speak
    "#{self.name} says arf!"
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{self.name} weighs #{self.weight} and is #{self.height} tall."
  end

  puts self
end

sparky = GoodDog.new("Sparky", "30 inches", "40lbs")
puts sparky.info
sparky.change_info("Tommy", "4 feet", "105lbs")
puts sparky.info