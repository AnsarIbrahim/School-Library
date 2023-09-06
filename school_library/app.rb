require_relative 'modules/create_persons'
require_relative 'modules/create_books'
require_relative 'modules/create_rentals'
require 'json'

class App
  extend CreatePerson
  extend CreateBook
  extend CreateRental

  def self.list_books
    # Load and display book data from the "books.json" file
    if File.exist?('school_library/data/books.json')
      data = JSON.parse(File.read('school_library/data/books.json'))
      data.each do |book_data|
        puts "Title: #{book_data['Title']}, Author: #{book_data['Author']}"
      end
    else
      puts 'No book data found.'
    end
  end

  def self.list_people
    # Load and display people data from the "people.json" file
    if File.exist?('school_library/data/people.json')
      data = JSON.parse(File.read('school_library/data/people.json'))
      data.each do |person_data|
        type = person_data['Type']
        id = person_data['ID']
        name = person_data['Name']
        age = person_data['Age']

        if type == 'Student'
          puts "[#{type}], ID: #{id}, Name: #{name}, Age: #{age}"
        elsif type == 'Teacher'
          specialization = person_data['Specialization']
          puts "[#{type}], ID: #{id}, Name: #{name}, Age: #{age}, Specialization: #{specialization}"
        else
          puts 'Invalid person type in JSON data.'
        end
      end
    else
      puts 'No people data found.'
    end
  end

  def self.list_rentals_for_person(person_id)
    # Load and display rentals for the specified person ID from the "rentals.json" file
    if File.exist?('school_library/data/rentals.json')
      data = JSON.parse(File.read('school_library/data/rentals.json'))
      rentals_for_person = data.select { |rental| rental['person']['id'] == person_id }

      if rentals_for_person.any?
        puts "Rentals for Person (ID: #{person_id}):"
        rentals_for_person.each do |rental|
          puts "Date: #{rental['date']}, Book: \"#{rental['book']['title']}\" rented by #{rental['person']['name']}"
        end
      else
        puts "No rentals found for Person (ID: #{person_id})."
      end
    else
      puts 'No rentals data found.'
    end
  end

  def self.run
    choice = display_menu
    choice = handle_choice(choice) while choice != 7
    puts 'Exiting the School Library application. Goodbye!'
  end
end
