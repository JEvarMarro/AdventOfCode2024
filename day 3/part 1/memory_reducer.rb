require_relative 'corrupted_memory_fixer'

class MemoryReducer
  attr_reader :sum

  def initialize
    @sum = 0
    calculate_sum
  end

  private

  def calculate_sum
    clean_memories = CorruptedMemoryFixer.new(corrupted_memory).fixed_memory
    clean_memories.each do |cleanup|
      a, b = cleanup.map!(&:to_i)
      @sum += a * b
    end
  end

  private

  def corrupted_memory
    file_path = File.expand_path('../puzzle_input.txt', __dir__)
    File.read(file_path)
  end
end