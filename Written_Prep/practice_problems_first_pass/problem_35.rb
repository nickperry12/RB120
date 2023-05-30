# What is Object Oriented Programming, and why was it created? What are the
# benefits of OOP, and examples of problems it solves?

=begin
Object Oriented Programming (OOP) is a programming paradigm that was designed to
combat the issues that arise when we have programs of a very large size and
complexity. As programs grow in size and complexity, the amount of dependcies on
pieces of code elsewhere in the program grows. If a change is made anywhere in
the program, it can lead to a cascade of bugs due the dependencies on that piece
of code. OOP allows our programs to instead become an interaction of many small
parts, as opposed to a giant blob of dependencies. It allows us to create
classes with reusability, as well as subclasses for more detailed behaviors.
=end

=begin
Encapsulation is taking pieces of functionality and hididng it away from the
rest of the code base. It's a form of data protection, using containers to store
methods and data where it can't be invoked or modified without obvious
intention. It defines boundaries within our code allowing us to achieve higher
levels of complexity while reducing the amount of dependencies. 

Ruby accomplishes encapsulation through the process of defining classes and
instantiating objects from those classes.
=end