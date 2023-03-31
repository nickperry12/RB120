class GoodDog

  def initialize(name)
    @name = name
  end

  def speak
    "#{@name} says arf!"
  end

  def big_stretch
    "#{@name} did a biiiiiig stretch!"
  end
end

sparky = GoodDog.new("Sparky")

tommy = GoodDog.new("Tommy")

puts tommy.speak
puts tommy.big_stretch