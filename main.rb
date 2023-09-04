require_relative 'school_library/app'
require_relative 'school_library/modules/display_menu'
def main
  App.run
end

def handle_choice(choice)
  extend DisplayMenu
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
    print 'Enter person ID: '
    person_id = gets.chomp.to_i
    list_rentals_for_person(person_id)
  else
    invalid_choice
  end
  display_menu
end

def invalid_choice
  puts 'Invalid choice. Please enter a valid option (1-7).'
end

main if __FILE__ == $PROGRAM_NAME
