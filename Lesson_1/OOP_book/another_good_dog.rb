class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a
  end

  private

  def human_years
    age * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
p sparky.human_years