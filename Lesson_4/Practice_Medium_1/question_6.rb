# Question 6

# If we have these two methods in the Computer class:

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

# and

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    self.template
  end
end

comp = Computer.new
comp.create_template
p comp.show_template

# What is the difference in the way the code works?

=begin
In the context of functionality, the code will work the same. When invoking the
`show_template` method, it will work as intended for both code snippets. The
difference between the two code snippets is functionality.

In the first snippet, we're using the getter method `template` (created by the
`attr_accessor` method) to return the value referenced by `@template`.

In the second code snippet we're essentially doing the same thing, except `self`
is being prefixed to template to call the getter method. Recall that prefixing
`self` to template is the equivalent to calling `comp.template`. 

The first example is better practice, as a general rule of thumb is to only use
`self` when needed. In this case, we don't need it, so we shouldn't use it.
=end