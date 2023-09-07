require 'minitest/autorun'
require_relative '../school_library/library/person'

class TestPerson < Minitest::Test
  def setup
    @person = Person.new(1, name: 'John', age: 25)
    @person_with_permission = Person.new(2, name: 'Alice', age: 16, parent_permission: true)
    @person_without_permission = Person.new(3, name: 'Bob', age: 16)
  end

  def test_initialize
    assert_equal 1, @person.id
    assert_equal 'John', @person.name
    assert_equal 25, @person.age
    assert_equal true, @person.instance_variable_get(:@parent_permission)
  end

  def test_of_age?
    assert_equal true, @person.send(:of_age?)
    assert_equal false, @person_with_permission.send(:of_age?)
    assert_equal false, @person_without_permission.send(:of_age?)
  end

  def test_correct_name
    assert_equal 'John', @person.correct_name
  end

  def test_all
    people = Person.all
    assert_includes people, @person
    assert_includes people, @person_with_permission
    assert_includes people, @person_without_permission
  end
end
