class Book
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  attr_reader :rentals

  def add_rental(rental)
    @rentals << rental
  end
end
