require 'minitest/autorun'
require_relative '../school_library/library/student'

class TestStudent < Minitest::Test
  def setup
    @student = Student.new(25, name: 'John')
    @student_with_permission = Student.new(16, name: 'Alice', parent_permission: true)
  end

  def test_initialize
    assert_equal 'John', @student.name
    assert_equal 25, @student.age
    assert_equal true, @student.instance_variable_get(:@parent_permission)
  end

  def test_play_hooky
    assert_equal '¯(ツ)/¯', @student.play_hooky
  end
end
