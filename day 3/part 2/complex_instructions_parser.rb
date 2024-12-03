require_relative '../instructions_parser'

class ComplexInstructionsParser < InstructionsParser
   def initialize 
    @scanning_regex = RegexHelper.regex_for_enabled_instructions
   end

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
end
