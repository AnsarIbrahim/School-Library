require_relative '../library/person'
require_relative '../models/book'
require_relative '../models/rental'
require_relative '../models/classroom'
require 'json'

module CreateBook
  def self.load_data_from_file
    return unless File.exist?('school_library/data/books.json')

    data = JSON.parse(File.read('school_library/data/books.json'))
    data.each do |book_data|
      title = book_data['Title']
      author = book_data['Author']
      Book.new(title, author)
    end
  end

  def self.save_data_to_file
    books_data = Book.all.map do |book|
      {
        'Title' => book.title,
        'Author' => book.author
      }
    end

    existing_data = begin
      JSON.parse(File.read('school_library/data/books.json'))
    rescue StandardError
      []
    end

    existing_data += books_data

    File.write('school_library/data/books.json', JSON.pretty_generate(existing_data))
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    Book.new(title, author)

    App.setting_should_save_data(true)

    puts 'Book created successfully.'
  end
end
