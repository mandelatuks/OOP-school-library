require_relative 'create_student'
require_relative 'create_teacher'

class CreatePerson
  def initialize(people)
    @people = people
    @create_student = CreateStudent.new(@people)
    @create_teacher = CreateTeacher.new(@people)
  end

  def create_person
    print 'if you want to create a student [Enter 1] or a teacher [Enter 2]:'
    person_role = gets.chomp
    case person_role
    when '1'
      @create_student.create_student
    when '2'
      @create_teacher.create_teacher
    else
      message('Your selection is invalid', 'Please make a valid selection')
    end
  end
end
