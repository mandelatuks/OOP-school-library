require_relative './base_decorator'

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

# the capitalize decorator that will inherit from the base decorator
