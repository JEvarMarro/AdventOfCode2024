require_relative 'regex_helper'

class InstructionsParser
  DO_INSTRUCTION = "do()"
  DONT_INSTRUCTION = "don't()"
  MUL_INSTRUCTION = "mul"

  def parse
    enabled = true
    total = 0
    tokens.each do |token|
      if token == DO_INSTRUCTION
        enabled = true
      elsif token == DONT_INSTRUCTION
        enabled = false
      elsif  token.start_with?(MUL_INSTRUCTION) && enabled
        x, y = token.scan(/\d+/).map(&:to_i)
        total += x * y
      end
    end
    return total
  end

  private

  def tokens
    @tokens ||= input.scan(@scanning_regex)
  end

  def input
    file_path = File.expand_path('puzzle_input.txt', __dir__)
    input = File.read(file_path)
  end
end
