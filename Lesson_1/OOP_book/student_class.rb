class Student
  def initialize(n, g)
    @name = n
    @grade = g
  end
  
  def better_grade_than?(other_student)
    puts "Well done!" if grade < other_student.grade
  end
  
  protected
  
  def grade
    @grade
  end
end
  
joe = Student.new('Joe', 'A')
bob = Student.new('Bob', 'C')
joe.better_grade_than?(bob)
