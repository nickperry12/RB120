# Access Denied

# Modify the following code so that the value of @phone_number can still be read
# as on line 10, but cannot be changed as on line 12.

=begin
Our goal here is to be able to have access to the phone number information, but
no access to being able to change this. We can achieve this by changing the
`attr*` method being used. We can use the `attr_reader` method instead, allowing
us to see the phone number but not change it. 
=end

class Person
  attr_reader :phone_number

  def initialize(number)
    @phone_number = number
  end
end

person1 = Person.new(1234567899)
puts person1.phone_number

person1.phone_number = 9987654321
puts person1.phone_number