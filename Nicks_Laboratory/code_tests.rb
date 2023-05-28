<<<<<<< HEAD
class Dog
  def walk
    "walking"
  end
end

class Human
  def walk
    "walking"
  end
end

[Human.new, Dog.new].each { |obj| puts obj.walk } 
=======
# Without adding any methods below, implement a solution; originally by Natalie Thompson, 
# this version by Oscar Cortes
class ClassA 
  attr_reader :field1, :field2
  
  def initialize(num)
    @field1 = "xyz"
    @field2 = num
  end
end

class ClassB 
  attr_reader :field1

  def initialize
    @field1 = "abc"
  end
end


obj1 = ClassA.new(50)
obj2 = ClassA.new(25)
obj3 = ClassB.new


p obj1.field2 > obj2.field2
p obj2.field2 > obj3.field1
>>>>>>> c3f215b0347c0b4d81d34c1435dfdb3aef6c47af
