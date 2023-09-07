require 'minitest/autorun'
require_relative 'spec_helper'

class TestDecorator < Minitest::Test
  def test_capitalize_decorator
    capitalized = CapitalizeDecorator.new(Person.new(1, name: 'maximilianus', age: 25))
    assert_equal 'Maximilianus', capitalized.correct_name
    trimmed = TrimmerDecorator.new(capitalized)
    assert_equal 'Maximilian', trimmed.correct_name
  end
end
