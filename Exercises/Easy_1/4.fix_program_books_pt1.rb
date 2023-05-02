# Fix the Program - Books (Part 1)

# Complete this program so that it produces the expected output:

# The author of "Snow Crash" is Neil Stephenson.
# book = "Snow Crash", by Neil Stephenson.

=begin
P:

Need to complete the program to produce the desired output.

Modeling:

class Book

Within it we have a constructor method:

`initialize` with two parameters `author` and `title`

No accessor methods => will need to add an `attr_reader` method
- should give us the desired output


=end
class Book
  attr_reader :title, :author

  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{@title}", by #{@author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

# Further Exploration

# What are the differences between attr_reader, attr_writer, and attr_accessor?
# Why did we use attr_reader instead of one of the other two? Would it be okay
# to use one of the others? Why or why not?

=begin
`attr_reader` takes in symbols as arguments and creates getter methods for them.
When we pass in `:title` and `:author`, it creates getter methods using those
names. `getter` methods allow us to return the value stored in the associated
instance variable.

`attr_writer` uses the symbols passed in to create `setter` methods, allowing us
to change the values referenced by the associated instance variables.
`attr_accessor` creates both `getter` and `setter` methods for the symbols
passed in. 

`attr_reader` is the most suitable method to use here, as our intention is to
return the values stored in the instance variables, not make changes to them.
=end

# Instead of attr_reader, suppose you had added the following methods to this
# class:

def title
  @title
end

def author
  @author
end

# Would this change the behavior of the class in any way? If so, how? If not,
# why not? Can you think of any advantages of this code?

=begin
This would not change the behavior of the class, as these are just manual ways
of creating getter methods without the use of the `attr_reader` method. The
advantage of using code like this however, is if we wanted to add more
functionality to our getter methods. For example, we wanted to capitaize the
name and title, we could call `capitalize` on `@name` and `@title` within their
respective methods.
=end