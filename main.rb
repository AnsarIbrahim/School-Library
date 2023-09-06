require_relative 'school_library/app'

def main
  App.run
end

def display_menu
  puts "\nPlease choose an option by entering a number:"
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List all rentals for a given person (by ID)'
  puts '7. Exit'
  print 'Enter your choice: '
  gets.chomp.to_i
end

def handle_choice(choice)
  case choice
  when 1
    App.list_books
  when 2
    App.list_people
  when 3
    App.create_person
  when 4
    App.create_book
  when 5
    App.create_rental
  when 6
    print 'Enter person ID: '
    person_id = gets.chomp.to_i
    App.list_rentals_for_person(person_id)
  else
    invalid_choice
  end
  display_menu
end

def invalid_choice
  puts 'Invalid choice. Please enter a valid option (1-7).'
end

main if __FILE__ == $PROGRAM_NAME
