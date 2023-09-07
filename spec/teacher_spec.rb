require 'minitest/autorun'
require_relative '../school_library/library/teacher'

class TestTeacher < Minitest::Test
  def setup
    @teacher = Teacher.new('Math', name: 'John', age: 25)
  end

  def test_initialize
    assert_equal 'John', @teacher.name
    assert_equal 25, @teacher.age
    assert_equal true, @teacher.instance_variable_get(:@parent_permission)
    assert_equal 'Math', @teacher.specialization
  end

  def test_can_use_services?
    assert_equal true, @teacher.can_use_services?
  end
end
