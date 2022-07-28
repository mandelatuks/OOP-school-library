require_relative 'teacher'

class CreateTeacher
  def initialize(people)
    @people = people
  end

  def create_teacher
    print 'Enter Name: '
    name = gets.chomp
    print ' Enter Age: '
    age = gets.chomp
    print 'Specialization:'
    specialization = gets.chomp
    person = Teacher.new(age, name, specialization)
    @people << person
    message('Person created successfullly', 'New Teacher was added')
  end
end