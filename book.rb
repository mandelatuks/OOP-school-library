class Book
  attr_accessor :title, :author
  attr_reader :rental

  def initialize(title, author)
    @title = title
    @author = author
    @rental = []
  end

  def add_rental(date, person)
    @rental.push(date, person, self)
  end
end
