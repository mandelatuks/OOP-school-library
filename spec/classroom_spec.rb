require './models/classroom'

describe Classroom do
  before :each do
    @classroom = Classroom.new 'Grade12'
  end
  it 'should do show the grade' do
    expect(@classroom.label).to eq 'Grade12'
  end
end
