class FarmAnimal
  def speak
    "#{self} says "
  end
end

class Sheep < FarmAnimal
  def speak
    super + "baa!"
  end
end

class Lamb < Sheep
  def speak
    super + "baaaaaaa!"
  end
end

class Cow < FarmAnimal
  def speak
    super + "mooooooo!"
  end
end

p Sheep.new.speak
p Lamb.new.speak
p Cow.new.speak 


# What is output and why? 

=begin
On line 25, `Sheep.new.speak` will output `"#<Sheep:0x00007f1da6ae4d20> says
baa!"`. On line 26, `Lamb.new.speak` wil output `"#<Lamb:0x00007f1da6ae4a78>
says baa!baaaaaaa!"`, and on line 27 `Cow.new.speak` will output
`"#<Cow:0x00007f1da6ae4870> says mooooooo!"`. This is output because the
`FarmAnimal#speak` method interpolates `self` into a string.

`self`, when used within an instance method, references the calling object. When
an object is interpolated into a string, the `to_s` method is implicitly called
on the object. In this case, `to_s` being called on each object will return a
string representation of the object it's called on, which will be the class it
is instantiated from followed by the hexadecimal ID that represents the space it
occupies in memory.

The `Cow`, `Sheep` and `Lamb` classes all subclass from the `FarmAnimal`
superclass. However, each class also defines their own `speak` method,
overriding `FarmAnimal#speak`. Within each method definition, the keyword
`super` is used, telling Ruby to search the method lookup math for each class,
and find a method with the same name to invoke. The return value provided by
`super` is then used to concatenate to another string.
=end
