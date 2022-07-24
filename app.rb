require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'
require_relative 'classroom'

class App
  attr_reader :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def choose_option(operation)
    case operation
    when '1'
      list_all_books
    when '2'
      list_all_people
    when '3'
      create_person

    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_all_rentals
    end
    print_options
  end

  def print_options
    puts ''
    puts 'WELCOME TO MANDELA LIBRARY APP! '
    puts ''
    puts 'please choose operation from the following options'
    puts '1 list all books'
    puts '2 list all people'
    puts '3 create a person'
    puts '4 create a book'
    puts '5 create a rental'
    puts '6 list all rentals for a given person id'
    puts 'q Quit'
    operation = gets.chomp
    exit if operation == 'q'
    choose_option(operation)
  end

  def message(issue, recommendation)
    sleep(0.5)
    puts '.'
    sleep(0.5)
    puts "---- #{issue}------"
    sleep(0.5)
    puts '. '
    sleep(0.5)
    puts '. '
    sleep(0.5)
    puts '.'
    sleep(1)
    puts "----- #{recommendation}------"
    sleep(0.5)
  end

  def list_all_books
    if @books.length.positive?
      @books.each_with_index do |book, index|
        puts "#{index + 1}) Tittle: #{book.title}, Author: #{book.author}"
      end

    else
      message('there is no book to display', 'kindly add some books')
    end
  end

  def list_all_people
    if @people.length.positive?
      @people.each_with_index do |person, index|
        puts "#{index + 1}) Name:#{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    else
      message('There is no person to display', 'Add person profiles first')
    end
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
    person = Student.new(age, name, parent_permission, classroom)
    @people << person
    message('Person created successfully', 'New student was added')
  end

  def create_teacher
    print 'Enter Name: '
    name = gets.chomp
    print ' Enter Age'
    age = gets.chomp
    print 'Specialization:'
    specialization = gets.chomp
    person = Teacher.new(age, name, specialization)
    @people << person
    message('Person created successfullly', 'New Teacher was added')
  end

  def create_person
    print 'if you want to create a student [Enter 1] or a teacher [Enter 2]:'
    person_role = gets.chomp
    case person_role
    when '1'
      create_student
    when '2'
      create_teacher
    else
      message('Your selection is invalid', 'Please make a valid selection')
    end
  end

  def create_book
    print 'Title:'
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    message('Book created successfully', 'Happy learning')
  end

  def create_rental
    puts 'Select a book from the following list by ID'
    puts ''
    list_all_books
    selected_book = @books[gets.chomp.to_i - 1]
    puts 'Select a person from the following list by serial number'
    puts ''
    list_all_people
    selected_person = @people[gets.chomp.to_i - 1]
    print 'Date: '
    date = gets.chomp
    @rentals << selected_person.add_rental(date, selected_book)
    message('New rental created', "Date: #{date}, Rental to: #{selected_person.name}, Book: #{selected_book.title}")
  end

  def list_all_rentals
    print 'Enter person ID: '
    id = gets.chomp.to_i
    person_details = @people.find { |person| person.id == id }
    if person_details
      puts 'Rentals'
      person_details.rental.each_with_index do |rental, index|
        puts "#{index + 1}) #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
      end
    else
      message('there is no rental to display', 'please create rental record')
    end
  end

  def start_app
    option = print_options
    choose_option(option)
  end
end
