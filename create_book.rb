require_relative 'book'

class CreateBook
  def initialize(books)
    @books = books
  end

  def create_book
    print 'Title:'
    title = gets.chomp.strip.capitalize
    print 'Author  '
    author = gets.chomp.strip.capitalize
    @books << Book.new(title, author)
    message('Book created successfully', 'Happy learning')
  end
end
