require './utils/options'

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
      @options.save_books_to_file
      @options.save_people_to_file
      @options.save_rental_data
    end
    puts 'thank you for using the app'
  end
end
