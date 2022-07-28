# require_relative 'person'
# require_relative 'student'
# require_relative 'teacher'
# require_relative 'rental'
# require_relative 'book'
# require_relative 'classroom'
require_relative 'options'

class App
  def initialize
    # it create an instance of option
    @options = Options.new
  end

  def run
    puts 'WELCOME TO MANDELA LIBRARY APP! '
    loop do
      @options.print_options
      operation = gets.chomp
      exit if operation == 'q'

      @options.choose_option operation
    end
    puts 'thank you for using the app'
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

  # def person_info
  #   print 'Age: '
  #   age = gets.chomp

  #   print 'Name: '
  #   name = gets.chomp
  #   [age, name]
  # end

  # def book_info
  #   print 'Title: '
  #   title = gets.chomp

  #   print 'Author: '
  #   author = gets.chomp
  #   [title, author]
  # end

  # def create_book
  #   # print 'Title:'
  #   # title = gets.chomp
  #   # print 'Author  '
  #   # author = gets.chomp
  #   title, author = book_info
  #   @books << Book.new(title, author)
  #   message('Book created successfully', 'Happy learning')
  # end

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
