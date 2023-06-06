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
Line 38 will output an array containing 6 elements. Each element will be an
object that is instantiated from the `Animal` class; it will show the class the
object is instantiated from, along with a hexadecimal number that represents the
space the object occupies in memory:

```
[#<Animal:0x00007f77184b46a0 @name="Human">, #<Animal:0x00007f77184b45b0
@name="Dog">, #<Animal:0x00007f77184b4538 @name="Cat">,
#<Animal:0x00007f77184b4420 @name="Eagle">, #<Animal:0x00007f77184b43a8
@name="Blue Jay">, #<Animal:0x00007f77184b4330 @name="Penguin">]
```

The local variables `mammals` and `birds` are both initialized to instances of
the `AnimalClass` class. When we call the `AnimalClass#+` method on `mammals`
with `birds` passed in as the argument, it will concatenate the array referenced
by the instance variable `@animals` in each class. While we do expect a
concatenated array to be returned as a result of `mammals + birds`, we may not
expect the elements to appear as they are. Instead, we might expect each element
to be the string referenced by the `@name` instance variable associated with
each `Animal` object.

To get the desired result of the animal names filling the resulting array, we
can change the functionality of the `AnimalClass#<<` method. Currently, the
method pushes the argument into an array, and in the context of this problem
we're pushing in `Animal` objects. We can instead change the method to this:

```
def <<(object)
  animals << object.name
end
```

By calling the `getter` method `name` on each object that is passed in, the
return value of `object.name` will be pushed in instead. This will give us an
array of the animal names which is more in line with what we would expect this
code to output.


=end
