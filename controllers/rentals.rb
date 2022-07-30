require 'json'
require './models/rental'

module RentalsController
  def load_rentals
    rental_store = []
    rent_file = open('./data/rentals.json')
    if File.exist?(rent_file) && File.read(rent_file) != ''
      data = rent_file.read
      JSON.parse(data).each do |rental|
        rental_store << Rental.new(rental['date'], person(rental[person.id]), book(rental[book.id]))
      end
    else
      File.write(rent_file, '[]')
    end
    rental_store
  end

  def save_rental_data
    rental_store = []
    @rentals.each do |rental|
      rental_store << { id: rental.id, person: rental.person, book: rental.book }
    end
    File.write('./data/rentals.json', rental_store.to_json)
  end
end
