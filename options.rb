require_relative 'create_book'
require_relative 'create_person'
require_relative 'create_student'
require_relative 'create_teacher'
require_relative 'create_rental'

class Options
  attr_accessor :title, :author

  def initialize
    @people = []
    @books = []
    @rentals = []
    @create_person = CreatePerson.new(@people)
    @create_book = CreateBook.new(@books)
    @create_rental = CreateRental.new(@people, @books)
  end

  def print_options
    puts ''
    puts 'please choose operation from the following options'
    puts '1 list all books'
    puts '2 list all people'
    puts '3 create a person'
    puts '4 create a book'
    puts '5 create a rental'
    puts '6 list all rentals for a given person id'
    puts 'q Quit'
  end

  def choose_option(operation)
    case operation
    when '1'
      list_all_books
    when '2'
      list_all_people
    when '3'
      @create_person.create_person
    when '4'
      @create_book.create_book
    when '5'
      @create_rental.create_rental
    when '6'
      list_all_rentals
    end
  end

  def list_all_books
    puts 'Books'.upcase
    if @books.length.positive?
      @books.each_with_index do |book, index|
        puts "#{index + 1}) Tittle: #{book.title}, Author: #{book.author}"
      end

    else
      print('There is no book to display', 'kindly add some books')
    end
  end

  def list_all_people
    if @people.length.positive?
      @people.each_with_index do |person, index|
        puts "#{index + 1}) Name:#{person.name}, ID: #{person.id}, Age: #{person.age}" if person.is_a?(Student)
        puts "#{index + 1}) Name:#{person.name}, ID: #{person.id}, Age: #{person.age}" if person.is_a?(Teacher)
      end
    else
      print('There is no person to display', 'Add person profiles first')
    end
  end

  def list_all_rentals
    print 'Enter person ID: '
    id = gets.chomp.to_i
    person_details = @people.find { |person| person.id == id }
    if person_details
      puts 'Rentals'
      person_details.rentals.each_with_index do |rental, index|
        puts "#{index + 1}) #{rental.date}, Book: #{rental.person.title} by #{rental.person.author}"
      end
    else
      print('There is no rental to display', 'Please create rental record')
    end
  end
end
