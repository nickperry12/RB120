# Question 3

# In the last question Alan showed Alyssa this code which keeps track of items
# for a shopping cart application:

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    quantity = updated_count if updated_count >= 0
  end
end

=begin

Alyssa noticed that this will fail when update_quantity is called. Since
quantity is an instance variable, it must be accessed with the @quantity
notation when setting it. One way to fix this is to change attr_reader to
attr_accessor and change quantity to self.quantity.

Is there anything wrong with fixing it this way?

-------- ANSWER --------

Using the `attr_accessor` method will create both setter and getter methods for
all of the passed in arguments: `:quantity` and `:product_name`. This will allow
the user to change the quantity and type of product for that invoice from the
public interface; we don't necessarily want the user to be able to do this. The
purpose of the `update_quantity` method is to change the quantity, this is
intentional; there's really no need for a setter method for `quantity` due to
this, and we don't need to change the product type after purchase either so a
setter method for `product_name` isn't required either.

It would be better to access the instance variable directly and keep using the
`attr_reader` method.

-------- LS Answer --------

Nothing incorrect syntactically. However, you are altering the public interfaces
of the class. In other words, you are now allowing clients of the class to
change the quantity directly (calling the accessor with the instance.quantity =
<new value> notation) rather than by going through the update_quantity method.
It means that the protections built into the update_quantity method can be
circumvented and potentially pose problems down the line.

=end