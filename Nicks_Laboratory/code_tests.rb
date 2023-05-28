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