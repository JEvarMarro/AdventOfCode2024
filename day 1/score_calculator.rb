require_relative 'file_reader'

class ScoreCalculator
  attr_reader :result
  def initialize
    @result = 0
    calculate
  end
end
