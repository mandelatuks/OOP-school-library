require_relative 'student'

class CreateStudent
  def initialize(people)
    @people = people
  end

  def create_student
    print 'Enter Name:'
    name = gets.chomp
    print 'Enter Age:'
    age = gets.chomp
    print 'Has parent permssion? [Y/N]'
    parent_permission = true && gets.chomp.downcase == 'y'
    print 'classroom:'
    classroom = gets.chomp
    @people << Student.new(age, classroom, name, parent_permission)
    print('Person created successfully', 'New student was added')
  end
end
