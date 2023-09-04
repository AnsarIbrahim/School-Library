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
    loop do
      display_menu
      choice = gets.chomp.to_i
      handle_choice(choice)
      break if choice == 7
    end
  end
end
