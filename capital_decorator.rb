require_relative './base_decorator'

class CapitalDeco < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
