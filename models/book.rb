require './models/rental'

class Book
  attr_accessor :id, :title, :author, :rentals

  def initialize(id, title, author)
    @id = id || Random.rand(1...1000)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    Rental.new(date, person, self)
  end
end
