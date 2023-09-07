require_relative 'decorator'

class TrimmerDecorator < Decorator
  def correct_name
    name = @nameable.correct_name
    name[0..9]
  end
end
