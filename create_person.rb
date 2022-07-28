require_relative 'create_student'

class CreatePerson
  def initialize(person)
    @person = person
  end

  def create_person
    print 'if you want to create a student [Enter 1] or a teacher [Enter 2]:'
    person_role = gets.chomp
    case person_role
    when '1'
      create_student(age, name)
    when '2'
      create_teacher(age, name)
    else
      message('Your selection is invalid', 'Please make a valid selection')
    end
  end
end
