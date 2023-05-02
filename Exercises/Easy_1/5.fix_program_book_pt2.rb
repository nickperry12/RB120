# Fix the Program - Books (Part 2)

# Complete this program so that it produces the expected output

# Expected Output:

# The author of "Snow Crash" is Neil Stephenson.
# book = "Snow Crash", by Neil Stephenson.

=begin
Modeling:

Need to add:

`initialize` method with two parameters `title` and `name`

accessor methods
  - attr_accessor most suitable as we need both getter and setter methods
=end

class Book
  attr_accessor :title, :author

  def initalize(title, author)
    @title = title
    @author = author
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

# Further Exploration

# What do you think of this way of creating and initializing Book objects? (The
# two steps are separate.) Would it be better to create and initialize at the
# same time like in the previous exercise? What potential problems, if any, are
# introduced by separating the steps?

=begin
I think it would be easier to initialize the instance variables within a
constructor method `initialize` that is invoked upon instantiaton of the object.
This gives the `book` object some attributes upon instantiation, and also
ensures we won't be referencing any `nil` values as the instance variables
will have been initialized to a value. Doing it this way also runs the risk of
allowing changes to be made both the title and author of the book object, which
could lead to problems in the rest of the program. 
=end