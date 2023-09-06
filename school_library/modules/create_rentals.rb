require_relative '../library/person'
require_relative '../models/book'
require_relative '../models/rental'
require_relative '../models/classroom'
require 'json'

module CreateRental
  def create_rental
    book_index = book_index_input
    person_index = person_index_input

    if person_index >= 1 && person_index <= Person.all.length
      print 'Date (YYYY-MM-DD): '
      date = gets.chomp

      rental = Rental.new(date, Book.all[book_index - 1], Person.all[person_index - 1])

      # Load existing rentals or initialize an empty array
      rentals = begin
        JSON.parse(File.read('school_library/data/rentals.json'))
      rescue StandardError
        []
      end

      # Append the new rental to the existing rentals
      append_rental(rentals, rental)

      # Write the updated rentals array to rentals.json
      File.write('school_library/data/rentals.json', JSON.pretty_generate(rentals))

      puts 'Rental created successfully.'
    else
      puts 'Invalid person selection. Please select a valid person.'
    end
  end

  def book_index_input
    puts 'Select a book from the following list by number:'
    Book.all.each_with_index do |book, index|
      puts "(#{index + 1}) Title: #{book.title}, Author: #{book.author}"
    end
    gets.chomp.to_i
  end

  def person_index_input
    puts 'Select a person from the following list by number (not id):'
    Person.all.each_with_index do |person, index|
      puts "(#{index + 1}) Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
    end
    gets.chomp.to_i
  end

  def append_rental(rentals, rental)
    rentals << {
      date: rental.date,
      person: {
        id: rental.person.id,
        age: rental.person.age,
        name: rental.person.name
      },
      book: {
        author: rental.book.author,
        title: rental.book.title
      }
    }
  end
end
