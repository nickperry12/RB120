class Student
  attr_accessor :grade

  def initialize(name, grade=nil)
    @name = name
  end 
end

ade = Student.new('Adewale')
p ade # => #<Student:0x00000002a88ef8 @grade=nil, @name="Adewale">


# Running the following code will not produce the output shown on the last line.
# Why not? What would we need to change, and what does this demonstrate about
# instance variables?

=begin
We don't get the desired output because the `@grade` instance variable hasn't
been initialized. When the `ade` object is passed into `p`, the `inspect` method
is implicitly called on the object, return the class it is instantiated from,
the hexadeicmal ID representing it's space in memory, and all instance variables
that have been initialized and the data that is stored within them.

To change this to get the desired output, we need to initialize `@grade` within
the constructor method to the argument that is being passed in. This demonstrates
that while we do have `setter` and `getter` methods available for `@grade`
=end