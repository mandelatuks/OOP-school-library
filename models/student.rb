# rubocop: disable Style/OptionalBooleanParameter
require './models/person'

class Student < Person
  # holding the relationship
  attr_reader :classroom

  def initialize(id, age, classroom, name = 'Unknown', parent_permission = true)
    super(age, name, parent_permission)
    @id = id || Random.rand(1...1000)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end

# rubocop: enable Style/OptionalBooleanParameter
