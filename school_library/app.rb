require_relative 'modules/create_persons'
require_relative 'modules/create_books'

class App
  extend CreatePerson
  extend CreateBook

  def self.list_books
    puts 'List of Books:'
    Book.all.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def self.list_people
    puts 'List of People (Teachers and Students):'

    Person.all.each do |person|
      if person.is_a?(Student)
        puts "[Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      elsif person.is_a?(Teacher)
        puts "[Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def self.run
    choice = display_menu
    choice = handle_choice(choice) while choice != 7
    puts 'Thanks for using the School Library!'
  end
end
