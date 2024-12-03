class FileReader
  def initialize
    @file_path = File.expand_path('puzzle_input.txt', __dir__)
  end
 
  def reports
    result = []
    File.foreach(@file_path) do |line|
      next if line.strip.empty?
      report = line.split
      result << report
    end
    result
  end
end
