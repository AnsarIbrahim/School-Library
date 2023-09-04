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
    gets.chomp.to_i
  end
end
