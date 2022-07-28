# rubocop: disable Style/OptionalBooleanParameter

require_relative './nameable'
require_relative 'rental'

class Person < Nameable
  attr_accessor :age, :name, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission = true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def of_age?
    @age >= 18
  end

  private :of_age?

  def method_name?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    Rental.new(date, self, book)
  end
end

# rubocop: enable Style/OptionalBooleanParameter
