class Parent
  def say_hi
    p "Hi from Parent."
  end
end

class Child
  def say_hi
    p "Hi from Child."
  end

  def send
    p "Send from Child..."
  end
end

mom = Parent.new
son = Child.new

# mom.say_hi
# son.say_hi
# son.send :say_hi
p son.instance_of? Parent
p son.instance_of? Child