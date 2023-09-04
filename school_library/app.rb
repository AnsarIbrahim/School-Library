require_relative "library/person"
require_relative "library/student"
require_relative "library/teacher"
require_relative "modules/create_persons"
require_relative "setup/classroom"
require_relative "setup/book"
require_relative "setup/rental"

class App
  extend CreatePerson

  def self.list_books
    puts "List of Books:"
    Book.all.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def self.list_people
    puts "List of People (Teachers and Students):"

    Person.all.each do |person|
      if person.is_a?(Student)
        puts "[Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      elsif person.is_a?(Teacher)
        puts "[Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def self.create_book
    print "Title: "
    title = gets.chomp
    print "Author: "
    author = gets.chomp
    Book.new(title, author)
    puts "Book created successfully."
  end

  def self.create_rental
    puts "Select a book from the following list by number:"
    Book.all.each_with_index do |book, index|
      puts "(#{index + 1}) Title: #{book.title}, Author: #{book.author}"
    end
    book_index = gets.chomp.to_i

    puts "Select a person from the following list by number (not id):"
    Person.all.each_with_index do |person, index|
      puts "(#{index + 1}) Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
    end
    person_index = gets.chomp.to_i

    if person_index >= 1 && person_index <= Person.all.length
      print "Date (YYYY-MM-DD): "
      date = gets.chomp

      Rental.new(date, Book.all[book_index - 1], Person.all[person_index - 1])
      puts "Rental created successfully."
    else
      puts "Invalid person selection. Please select a valid person."
    end
  end

  def self.list_rentals_for_person(person_id)
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

  def self.run
    loop do
      display_menu
      choice = gets.chomp.to_i
      handle_choice(choice)
      break if choice == 7
    end
  end

  def self.display_menu
    puts "\nPlease choose an option by enter a number:"
    puts "1. List all books"
    puts "2. List all people"
    puts "3. Create a person"
    puts "4. Create a book"
    puts "5. Create a rental"
    puts "6. List all rentals for a given person (by ID)"
    puts "7. Exit"
    print "Enter your choice: "
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def self.handle_choice(choice)
    case choice
    when 1
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      print "Enter person ID: "
      person_id = gets.chomp.to_i
      list_rentals_for_person(person_id)
    when 7
      puts "Thanks you for using this app!"
    else
      invalid_choice
    end
  end

  # rubocop:enable Metrics/CyclomaticComplexity
  def self.invalid_choice
    puts "Invalid choice. Please enter a valid option (1-7)."
  end
end
