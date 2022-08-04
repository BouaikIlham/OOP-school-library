class Classroom
  attr_accessor :lable
  attr_reader :student

  def initialize(lable)
    @lable = lable
    @student = student
  end

  def add_student(student)
    @students << student
    student.classroom = self
  end
end
