class AnimalClass
  attr_accessor :name, :animals
  
  def initialize(name)
    @name = name
    @animals = []
  end
  
  def <<(animal)
    animals << animal
  end
  
  def +(other_class)
    animals + other_class.animals
  end
end

class Animal
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
end

mammals = AnimalClass.new('Mammals')
mammals << Animal.new('Human')
mammals << Animal.new('Dog')
mammals << Animal.new('Cat')

birds = AnimalClass.new('Birds')
birds << Animal.new('Eagle')
birds << Animal.new('Blue Jay')
birds << Animal.new('Penguin')

some_animal_classes = mammals + birds

p some_animal_classes 

# What is output? Is this what we would expect when using `AnimalClass#+`? If
# not, how could we adjust the implementation of `AnimalClass#+` to be more in
# line with what we'd expect the method to return?

=begin
On line 38 the `p` method is invoked, passing in the local varaible
`some_animal_classes` as an argument. `some_animal_classes` is initialized on
line 36 to the concatenation of the object `mammals` and `birds`. The
`AnimalClass#+` method is defined on lines 13 - 15, and within the method
definition, we are calling the `Array#+` method on the array referenced by the
`AnimalClass#animals` setter method, and passing in the return value of the
invocation of the `AnimalClass#animals` setter method on the object that is
passed in as an argument. This method returns a new array containing the
elements from both arrays. 

Line 38 will output a new array filled with `Animal` objects. Each element will
be an object of the `Animal` class, with it's hexadecimal object id, and all
initialized instance variables of that object.

While we do expect a new concatenated array to be output, what we might not
expect is the elements within the array to be `Animal` objects. One might
instead expect an array of the names of the `Animal` objects to be returned
instead. To adjust the implementation, we can slightly alter the `AnimalClass#+`
method to the following

```
def +(other_class)
  animals.map(&:name) + other_class.animals.map(&:name)
end
```

By calling map on each array, we're transforming the elements and calling the
`Animal#name` method on each object, returning an array with the animal names.
=end