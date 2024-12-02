require_relative 'file_reader'

class DistanceCalculator
  attr_reader :distance

  def initialize
    @distance = 0
    @left_column, @right_column = FileReader.new.sorted_columns
    calculate_total_distance
  end
 
  private
 
  def calculate_total_distance
    for i in 0...collection_size
      @distance += calculate_distance_between(i)
    end
  end
  
  def calculate_distance_between(index)
    (@left_column[index].to_i - @right_column[index].to_i).abs
  end
 
  def collection_size
    [@left_column.size, @right_column.size].min
  end
 
  def distance_calculator
    @distance_calculator ||= DistanceCalculator.new
  end
end
