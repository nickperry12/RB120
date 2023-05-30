class MeMyselfAndI
  self

  def self.me
    self
  end

  def myself
    self
  end
end

i = MeMyselfAndI.new


# What does each `self` refer to in the above code snippet?

=begin
`self` on line 2 will reference the class, as it's scoped at the class level.
`self` on line 5 will again reference the class, as it is being used within a
class method, which is scoped at the class level. `self` on line 9 will
reference the calling object as it is being used within an instance method,
which is scoped at the instance/object level.
=end
