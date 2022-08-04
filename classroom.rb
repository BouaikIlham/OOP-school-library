class Classroom 
    attr_accessor :lable
    attr_reader :Student

    def initialize(lable)
        @lable = lable
        @Student = Student
    end

    def add_student(Student)
         @students << student
         student.classroom = self
    end
end