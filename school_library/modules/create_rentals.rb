require_relative '../library/person'
require_relative '../models/book'
require_relative '../models/rental'
require_relative '../models/classroom'
require 'json'

module CreateRental
  def self.load_rentals_from_file
    JSON.parse(File.read('school_library/data/rentals.json'))
  rescue StandardError
    []
  end

  @rentals = load_rentals_from_file

  def self.create_rental
    book_index = book_index_input
    person_index = person_index_input

    return puts 'Invalid person selection. Please select a valid person.' if invalid_person?(person_index)

    date = rental_date
    rental = create_rental_object(book_index, person_index, date)

    add_rental_to_list(rental)
    App.setting_should_save_data(true)
    puts 'Rental created successfully.'
  end

  def self.invalid_person?(person_index)
    person_index < 1 || person_index > Person.all.length
  end

  def self.rental_date
    print 'Date (YYYY-MM-DD): '
    gets.chomp
  end

  def self.create_rental_object(book_index, person_index, date)
    Rental.new(date, Book.all[book_index - 1], Person.all[person_index - 1])
  end

  def self.add_rental_to_list(rental)
    @rentals << {
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

  def self.book_index_input
    puts 'Select a book from the following list by number:'
    Book.all.each_with_index do |book, index|
      puts "(#{index + 1}) Title: #{book.title}, Author: #{book.author}"
    end
    gets.chomp.to_i
  end

  def self.person_index_input
    puts 'Select a person from the following list by number (not id):'
    Person.all.each_with_index do |person, index|
      puts "(#{index + 1}) Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
    end
    gets.chomp.to_i
  end

  def self.save_data_to_file
    File.write('school_library/data/rentals.json', JSON.pretty_generate(@rentals))
  end
end
