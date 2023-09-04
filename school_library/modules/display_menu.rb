module DisplayMenu
  def display_menu
    puts "\nPlease choose an option by enter a number:"
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a given person (by ID)'
    puts '7. Exit'
    print 'Enter your choice: '
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def handle_choice(choice)
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
    when 7
      puts 'Thanks you for using this app!'
    else
      invalid_choice
    end
  end

  # rubocop:enable Metrics/CyclomaticComplexity

  def invalid_choice
    puts 'Invalid choice. Please enter a valid option (1-7).'
  end
end
