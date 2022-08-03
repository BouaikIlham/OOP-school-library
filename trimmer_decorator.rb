require './decorator'

class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name.strip[0..9] if @nameable.correct_name.length > 10
  end
end
