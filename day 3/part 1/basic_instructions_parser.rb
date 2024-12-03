require_relative '../instructions_parser'

class BasicInstructionsParser < InstructionsParser
  def initialize
    @scanning_regex = RegexHelper.regex_for_multiplication
  end

  def parse
    enabled = 
    true
    total = 0
    tokens.each do |token|
      x, y = token.scan(/\d+/).map(&:to_i)
      total += x * y
    end
    return total
  end
end
