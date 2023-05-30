class Student
  attr_accessor :name, :grade

  def initialize(name)
    @name = name
    @grade = nil
  end
  
  def change_grade(new_grade)
    self.grade = new_grade
  end
end

priya = Student.new("Priya")
priya.change_grade('A')
p priya.grade 


# In the above code snippet, we want to return `”A”`. What is actually returned
# and why? How could we adjust the code to produce the desired result?

=begin
`nil` is being returned by the expression `priya.grade` instead of `"A"`. This
occurs because of the syntax within the `#change_grade` method; Ruby sees the
line `grade = new_grade` and treats it as a local method variable `grade` being
initialized to the argument that is passed in. To adjust the code and get our
desired output, we can prefix `grade` with `self`, which tells Ruby we are
invoking a `setter` method for the `@grade` instance variable.
=end
