# Question 2

# Alan created the following code to keep track of items for a shopping cart
# application he's writing:

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    self.quantity = updated_count if updated_count >= 0
  end
end

invoice = InvoiceEntry.new("hammer", 3)
p invoice.product_name
p invoice.quantity
invoice.update_quantity(5)
p invoice.quantity



=begin

Alyssa looked at the code and spotted a mistake. "This will fail when
update_quantity is called", she says.

Can you spot the mistake and how to address it?

-------- ANSWER --------

The problem is that within the `update_quantity` method we are trying to use a
setter method `quantity`. However, we're using an `attr_reader` method for our
instance variables, and there is no setter method defined outside of that. Due
to this, the `update_quantity` method is instead initializing a local method
variable to the argument passed in, and our `quantity` instance variable never
gets reassigned to the new value.

To fix this, we can change our `attr_reader` method to an `attr_accessor` method
and then prepend `quantity` within the `update_quantity` method with `self.`.
This will instead call the setter method and reassign the `@quantity` instance
variable.

Alternatively, we could keep the `attr_reader` method in place and instead
prefix `quantity` with an `@` to access the `@quantity` instance variable
directly.




-------- LS Answer --------

The problem is that since quantity is an instance variable, it must be accessed
with the @quantity notation when setting it. Even though attr_reader is defined
for quantity, the fact that it's a reader means that there is implicitly a
method for retrieving the value (a "getter") but the setter is undefined. So
there are two possible solutions:

change attr_reader to attr_accessor, and then use the "setter" method like this:
self.quantity = updated_count if updated_count >= 0. reference the instance
variable directly within the update_quantity method, like this @quantity =
updated_count if updated_count >= 0
=end