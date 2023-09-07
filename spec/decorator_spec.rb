require "minitest/autorun"
require_relative "../school_library/decorators/capitalize_decorator"
require_relative "../school_library/decorators/trimmer_decorator"
require_relative "../school_library/library/person"

class TestDecorator < Minitest::Test
  def test_capitalize_decorator
    capitalized = CapitalizeDecorator.new(Person.new(1, name: "maximilianus", age: 25))
    assert_equal "Maximilianus", capitalized.correct_name
    trimmed = TrimmerDecorator.new(capitalized)
    assert_equal "Maximilian", trimmed.correct_name
  end
end
