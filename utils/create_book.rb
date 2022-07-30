require './models/book'
require './controllers/books'

class CreateBook
  def initialize(books)
    @books = books
  end

  def create_book
    print 'Title:'
    title = gets.chomp.strip.capitalize
    print 'Author  '
    author = gets.chomp.strip.capitalize
    @books << Book.new(nil, title, author)
    print('Book created successfully', 'Happy learning')
  end
end
