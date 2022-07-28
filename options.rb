class Options
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
      create_person

    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_all_rentals
    end
  end
end
