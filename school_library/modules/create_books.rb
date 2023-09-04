require_relative '../library/person'
require_relative '../models/book'
require_relative '../models/rental'
require_relative '../models/classroom'

module CreateBook
  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    Book.new(title, author)
    puts 'Book created successfully.'
  end

  def create_rental
    puts 'Select a book from the following list by number:'
    Book.all.each_with_index do |book, index|
      puts "(#{index + 1}) Title: #{book.title}, Author: #{book.author}"
    end
    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id):'
    Person.all.each_with_index do |person, index|
      puts "(#{index + 1}) Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
    end
    person_index = gets.chomp.to_i

    if person_index >= 1 && person_index <= Person.all.length
      print 'Date (YYYY-MM-DD): '
      date = gets.chomp

      Rental.new(date, Book.all[book_index - 1], Person.all[person_index - 1])
      puts 'Rental created successfully.'
    else
      puts 'Invalid person selection. Please select a valid person.'
    end
  end

  def list_rentals_for_person(person_id)
    person = Person.all.find { |p| p.id == person_id }

    if person
      puts "Rentals for Person (ID: #{person_id}):"
      person.rentals.each do |rental|
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end
    else
      puts "Person with ID #{person_id} not found."
    end
  end
end
