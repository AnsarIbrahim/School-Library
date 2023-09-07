require_relative '../school_library/models/book'
require 'minitest/autorun'

class TestBook < Minitest::Test
  def setup
    @book = Book.new('Test Book', 'Test Author')
  end

  def test_initialize
    assert_equal 'Test Book', @book.title
    assert_equal 'Test Author', @book.author
    assert_empty @book.rentals
  end

  def test_add_rental
    rental = Minitest::Mock.new
    @book.add_rental(rental)
    assert_equal [rental], @book.rentals
  end

  def test_all
    assert_includes Book.all, @book
  end
end
