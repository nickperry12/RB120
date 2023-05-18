# Files

# You started writing a very basic class for handling files. However, when you
# begin to write some simple test code, you get a NameError. The error message
# complains of an uninitialized constant File::FORMAT.

# What is the problem and what are possible ways to fix it?

class File
  attr_accessor :name, :byte_content

  def initialize(name)
    @name = name
  end

  alias_method :read,  :byte_content
  alias_method :write, :byte_content=

  def copy(target_file_name)
    target_file = self.class.new(target_file_name)
    target_file.write(read)

    target_file
  end

  def to_s
    "#{name}.#{self.class::FORMAT}"
  end
end

class MarkdownFile < File
  FORMAT = :md
end

class VectorGraphicsFile < File
  FORMAT = :svg
end

class MP3File < File
  FORMAT = :mp3
end

# Test

blog_post = MarkdownFile.new('Adventures_in_OOP_Land')
blog_post.write('Content will be added soon!'.bytes)

copy_of_blog_post = blog_post.copy('Same_Adventures_in_OOP_Land')

puts copy_of_blog_post.is_a? MarkdownFile     # true
puts copy_of_blog_post.read == blog_post.read # true

puts blog_post

=begin
Solution:

When we try to reference the constant `FORMAT`, we're getting an error thrown
saying that the constant has been uninitialized. This happens because constants
have lexical scope. When we try to reference a constant, it will first check the
surrounding structure. `FORMAT` is not initialized within the `File` class, so
Ruby will then check the method lookup chain for the constant. If it doesn't
find it within any of those classes or modules, it will check the main scope.
Because `FORMAT` is not initialized anywhere lexically or in the lookup chain,
an error is thrown.

To resolve this, on line 27 where we try to reference `FORMAT`, we can use the
namespace resolution operator to tell Ruby where to specifically look for the
constant. Because the constants are initialized within the subclasses of `File`,
we can prefix `FORMAT` with `self.class::`. In this context, `self` refers to the
calling object, which we then call the `class` method on, returning the class
that object belongs to, followed by the namespace resolution operator. Now, Ruby
knows where to specifically look for the constant `FORMAT`.
=end