require_relative 'options'

class CreateRental
  def initialize(people, books)
    @people = people
    @books = books
  end

  def create_rental
    puts 'Select a book from the following list by ID'
    puts ''
    Options.list_all_books
    selected_book = @books[gets.chomp.to_i - 1]
    puts 'Select a person from the following list by serial number'
    puts ''
    Options.list_all_people
    selected_person = @people[gets.chomp.to_i - 1]
    print 'Date: '
    date = gets.chomp
    @rentals << selected_person.add_rental(date, selected_book)
    message('New rental created', "Date: #{date}, Rental to: #{selected_person.name}, Book: #{selected_book.title}")
  end
end
