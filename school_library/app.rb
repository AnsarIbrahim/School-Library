require_relative 'modules/create_persons'
require_relative 'modules/create_books'
require_relative 'modules/lists'

class App
  extend CreatePerson
  extend CreateBook
  extend Lists

  def self.run
    choice = handle_choice(choice) while choice != 7
    puts 'Thanks for using the School Library!'
  end
end
