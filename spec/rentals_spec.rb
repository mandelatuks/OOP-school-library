require './models/teacher'
require './models/book'
require './models/student'

describe Rental do
  before :each do
    @person = Student.new nil, nil, 19, 'Mandela', parent_permission: true
    @book = Book.new nil, 'Hello', 'World'
    @rental = Rental.new '2022/06/22', @person, @book
  end

  it 'should display rented book title' do
    @person.rentals.each do |rental|
      expect(rental.person.title).to eq 'Hello'
    end
  end
  it 'should display rented date' do
    @person.rentals.each do |rental|
      expect(rental.date).to eq '2022/06/22'
    end
  end
end
