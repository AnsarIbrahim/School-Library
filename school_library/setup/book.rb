class Book
  attr_accessor :title, :author, :rentals

  @all_books = []

  class << self
    def all
      @all_books
    end
  end

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    self.class.all << self
  end

  def add_rental(rental)
    @rentals << rental
  end
end
