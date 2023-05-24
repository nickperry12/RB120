class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "My name is #{name.upcase!}."
  end
end

bob = Person.new('Bob')
puts bob.name
puts bob
puts bob.name


# What is output on `lines 14, 15, and 16` and why?

=begin
On line 13, a new object is instantiated from the `Person` class, and is
assigned to the local variable `bob`. A string with the value `"Bob"` is passed
into the `new` method, which then gets passed into the `Person#initialize`
constructor method. The constructor method gets invoked upon instantiation of an
object. Within the `initialize` method definition on lines 4-6, the instance
variable `@name` is initialized to the argument passed into the method. Upon
instantiation of the `bob` object, `@name` will reference the string `"Bob"`.

On line 14, the `getter` method `name` is invoked on `bob`, returning the value
of `@name`, which is then passed into a `puts` method call. This will output
`"Bob"`.

On line 15, we pass the object `bob` as an argument into a `puts` method call.
`puts` implicitly calls `to_s` on the argument being passed in. Within the
`Person` class on lines 8-10, a `to_s` method call is defined, overriding the
built in `to_s` Ruby method. This returns a string with `name.upcase!`
interpolated into it. This string is returned when `to_s` is called on `bob`,
resulting in the string `"My name is BOB."` being output when `bob` is passed
into `puts`. 

On line 16, the return value of `bob.name` is being passed into `puts` once
again, however, this time it will output `"BOB"`. The output this time is
different because on line 9, the destructive `upcase!` method is called on
`name`, mutating the string referenced by `name`.
=end
