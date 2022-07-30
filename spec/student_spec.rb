require './models/student'

describe Student do
  context 'When providing student information' do
    age = 15
    student = Student.new(age, nil, 'Ian', true)

    it 'Creates a new student with an age of 20 and a name of Ian' do
      expect(student).to be_an_instance_of Student
    end
  end
end
