# Community Library

# On line 42 of our code, we intend to display information regarding the books
# currently checked in to our community library. Instead, an exception is
# raised. Determine what caused this error and fix the code so that the data is
# displayed as expected.

class Library
  attr_accessor :address, :phone, :books

  def initialize(address, phone)
    @address = address
    @phone = phone
    @books = []
  end

  def check_in(book)
    books.push(book)
  end

  def display_books
    books.each { |book| book.display_data }
  end
end

class Book
  attr_accessor :title, :author, :isbn

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
  end

  def display_data
    puts "---------------"
    puts "Title: #{title}"
    puts "Author: #{author}"
    puts "ISBN: #{isbn}"
    puts "---------------"
  end
end

community_library = Library.new('123 Main St.', '555-232-5652')
learn_to_program = Book.new('Learn to Program', 'Chris Pine', '978-1934356364')
little_women = Book.new('Little Women', 'Louisa May Alcott', '978-1420951080')
wrinkle_in_time = Book.new('A Wrinkle in Time', 'Madeleine L\'Engle', '978-0312367541')

community_library.check_in(learn_to_program)
community_library.check_in(little_women)
community_library.check_in(wrinkle_in_time)

community_library.display_books

# My Solution

=begin
The issue with the code is that we're attempting to call the `display_data`
method on the return value of the invocation of `books` on the an instantiation
of the `Library` class. This throws an error because the `display_data` method
is not available to objects of the `Library` class, as it is an instance method
defined within the `Book` class.

Calling the `books` getter method on the `community_library` object returns an
array of `Book` objects. Since we're trying to call `display_data` that array,
we can assume that we mean to call this method on each `Book` object, and return
the associate data with each book. 

To get this code snippet to work, we can invoke the `each` method on the return
value of `community_library.books` (again, which returns an array of `Book`
objects), iterate through the array, and invoke the `Book#display_data`
instance method on each `Book` object being passed in to the block.

Alternatively, to stick with the principles of OOP, we can implement a new
method within the `Library` class called `Library#display_books`, that functions
the same as what we did above, but is instead encapsulated within the `Library`
class. This would be the preferred solution as it follows the principles of OOP
by creating a method that exhibits a behavior specific to the `Library` class.
=end