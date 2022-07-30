require './utils/options'

class CreateRental
  def initialize(people, books, rentals)
    @people = people
    @books = books
    @rentals = rentals
  end

  def create_rental
    puts 'Select a book from the following list by ID'
    puts ''
    @books.each_with_index do |book, index|
      puts "#{index + 1}) Tittle: #{book.title}, Author: #{book.author}"
    end
    selected_book = @books[gets.chomp.to_i - 1]
    puts 'Select a person from the following list by serial number'
    puts ''
    @people.each_with_index do |person, index|
      puts "#{index + 1}) Name:#{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    selected_person = @people[gets.chomp.to_i - 1]
    print 'Date: '
    date = gets.chomp
    @rentals << selected_person.add_rental(date, selected_book)
    print('Rental created', "Date: #{date}, Rental to: #{selected_person.name}, Book: #{selected_book.title}")
  end
end
