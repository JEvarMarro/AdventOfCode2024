require_relative 'regex_helper'

class CorruptedMemoryFixer
  def initialize(corrupted_memory)
    @corrupted_memory = corrupted_memory
  end

  def fixed_memory
    multiplications_strings = @corrupted_memory.scan(RegexHelper.regex_for_multiplication)
    multiplications_strings.map do |multiplications_string|
      multiplications_string.scan(RegexHelper.regex_for_multiplication_factors).reject { |element| element.strip.empty? }
    end
  end
end
