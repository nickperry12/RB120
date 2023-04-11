# Private Secret

# Using the following code, add a method named share_secret that prints the
# value of @secret when invoked.

=begin
We know that anything below the `private` method call will not be available
outside of the class, and will only be available to other metods within the
class. 

In this case, we want to use the return value of the `secret` getter method,
however since it's below the `private` method call, we must reference this
method without the prepended `self`. 
=end

class Person
  attr_writer :secret

  def share_secret
    puts "#{secret}"
  end

  private

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
person1.share_secret