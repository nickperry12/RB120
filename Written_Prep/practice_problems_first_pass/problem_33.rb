# What is encapsulation, and why is it important in Ruby? Give an example.

=begin
Encapsulation is hiding pieces of functionality away from the rest of the code
base. It's a form of data protection that is accomplished by creating containers
for code and making it unavailable to the public interface, so that data and
objects cannot be manipulated without obvious intention. It defines boundaries
within our program, allowing us to reach higher levels of complexity while
reducing the amount of dependencies in our program. It also allows the
programmer to think at higher levels of abstraction, using real world nouns for
class names and verbs for behaviors.

Ruby accomplishes encapsulation by defining classes and placing behaviors and
states within these classes.

```ruby
class Person
  def set_name(name)
    @name = name
  end
end
```

Here a `Person` class is defined with a single method `set_name`. We cannot
invoke this method without first instantiating a new object of the class, and
then calling the method on it.

```ruby
nick = Person.new
nick.set_name("Nick")
```
=end