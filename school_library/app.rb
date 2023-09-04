require_relative 'modules/display_menu'
require_relative 'modules/create_persons'
require_relative 'modules/create_books'
require_relative 'modules/lists'

class App
  extend DisplayMenu
  extend CreatePerson
  extend CreateBook
  extend Lists

  def self.run
    choice = display_menu
    choice = handle_choice(choice) while choice != 7
    puts 'Thank you for using the School Library App!'
  end
end
