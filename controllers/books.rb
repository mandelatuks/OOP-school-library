require 'json'
require './models/book'

module BooksController
  def load_books
    book_store = []
    book_file = open('./data/books.json')
    if File.exist?(book_file) && File.read(book_file) != ''
      data = book_file.read
      JSON.parse(data).each do |book|
        book_store << Book.new(book['id'], book['title'], book['author'])
      end
    else
      File.write(book_file, '[]')
    end
    book_store
  end

  def save_books_to_file
    book_store = []
    @books.each do |book|
      book_store << { id: book.id, title: book.title, author: book.author }
    end
    File.write('./data/books.json', book_store.to_json)
  end
end
