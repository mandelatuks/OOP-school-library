require './utils/capital_decorator'
require './utils/trimmer_decorator'
require './models/person'

describe Decorator do
  before :each do
    @person = Person.new 16, 'Benebake'
    @capitalize = CapitalizeDecorator.new(@person)
    @trimmer_decorator = TrimmerDecorator.new(@capitalize)
  end

  it 'Should display john' do
    expect(@person.correct_name).to eq 'Benebake'
  end

  it 'should capitalize personne name' do
    expect(@capitalize.correct_name).to eq 'Benebake'
  end

  it 'should slice if sting is more than 10 char' do
    expect(@trimmer_decorator.correct_name).to eq 'Benebake'
    expect(@trimmer_decorator.correct_name.length).to be <= 10
  end
end
